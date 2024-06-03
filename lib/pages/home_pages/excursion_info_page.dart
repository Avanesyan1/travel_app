import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/excursion_info.dart';
import 'package:travel_app/service/cloud_service.dart';
import 'package:travel_app/service/email_send_service.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/textField/textField.dart';

// ignore: must_be_immutable
class ExcursionInfoPage extends StatelessWidget {
  final excursionInfo excursion;

  ExcursionInfoPage({super.key, required this.excursion});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final CloudService _cloud = CloudService();

  late String userId;

  Future _getUserInfo(email)async{
    DocumentSnapshot document = await _cloud.getUserData(userId);
    if (document.exists) {
      var data = document.data() as Map<String, dynamic>?;

      if (data != null) {
          // set user info 
          usernameController.text = (data['firstname'] ?? '') + (data['secondname'] ?? '');
          phoneNumberController.text = (data['phone_number'] ?? '').toString();
          emailController.text = email;
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: MyButton(
                  onTap: (){
                    // get user info 
                    final user = FirebaseAuth.instance.currentUser;
                     if (user != null) {
                       userId = user.uid;
                       _getUserInfo(user.email);
                      }
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                            return AlertDialog(
                              backgroundColor: white ,
                                shadowColor: white,
                                title: const Text('Оставьте заявку'),
                                content: const Text('и наш менеджер свяжется с вами в ближайшее время!',style: bf16w4,),
                                actions: [
                                  MyTextField(labelText: 'Имя Фамилия', controller: usernameController),
                                  MyTextField(labelText: 'Номер Телефона', controller: phoneNumberController,),
                                  MyTextField(labelText: 'Почта', controller: emailController),
                                  MyButton(onTap: (){
                                          sendEmail(
                                            'Новая заявка  :${excursion.name}',
                                            'Имя ${usernameController.text},Номер ${phoneNumberController.text},Почта ${emailController.text}',
                                          );
                                          Navigator.of(context).pop();
                                          showDialog(
                                            context: context, 
                                            builder: (BuildContext context){
                                              return AlertDialog(
                                                backgroundColor: white,
                                                shadowColor: white,
                                                title: const Text('Заявка отправлена'),
                                                content: const Text('Ожидайте звонка', style: bf16w4,),
                                                actions:[
                                                  MyButton(
                                                    onTap: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    text: "OK", 
                                                    fw: w500, 
                                                    textColor: white, 
                                                    font_s: 16, 
                                                    color: purple, 
                                                    borderColor: black,
                                                  ),
                                                ],
                                              );
                                            }
                                          );
                                       }, 
                                      text: "Отправить", 
                                      fw: w500, 
                                      textColor:
                                      white, 
                                      font_s: 16, 
                                      color: purple, 
                                      borderColor: black,)
                                  ],
                              );   
                          }
                     );
                  }, 
                  text:'Оставить заявку', 
                  fw: w600, 
                  textColor: white, 
                  font_s: 16, 
                  color: purple, 
                  borderColor: black)),
      body: Stack(
        children: [
          SizedBox( 
              height: MediaQuery.of(context).size.height * 0.365,
              child: PageView.builder(
                itemCount: excursion.images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Image.asset(excursion.images[index]), 
                  );
                }
              ),
          ),
          Padding(
            padding: a16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: white),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(Icons.arrow_back)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
              ),
             height: MediaQuery.of(context).size.height * 0.7,
             child: SingleChildScrollView(
              padding: a16,
              child: Column(
                children:[
      
                  const SizedBox(height: 10),
                  Column(
                children: [
                  Row(
                    mainAxisAlignment: spb,
                    children: [
                  Expanded(child: Text(excursion.name,style: bf14w4)),
                  const SizedBox(height: 10),   
                  Text('${excursion.price.toString()}р.\\чел.',style: bf16w6),
                    ]
                  ),
                  ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                      children: [
                              Center(child: Text(excursion.info1,style: bf14w4)),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Column(
                      children: [
                              Text(excursion.info2,style: bf14w4),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Column(
                      children:[
                              Text(excursion.info2,style: bf14w4),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Column(
                      children: [
                              Text(excursion.info3,style: bf14w4),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Column(
                      children: [
                              Text(excursion.time, style: bf14w4),
                      ],
                    ),
                  const SizedBox(height: 10),
                    Column(
                      children:[
                              Text(excursion.person_count, style: bf14w4),
                      ], 
                    ),
                  const SizedBox(height: 10,)
                ],
              ),
              ) ,
            ),
          ),
        ],
      )
    );
  }
}


