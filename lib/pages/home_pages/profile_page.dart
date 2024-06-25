import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/textField/textField.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/cloud_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final CloudService _cloud = CloudService();
  final firestoreInstance = FirebaseFirestore.instance;

  late String userId;

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController secondnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future _saveUserInfo(String firstname, String secondname, int age, int phoneNumber) async {
    await _cloud.saveProfileData(firstname, secondname, age, phoneNumber, userId);
  }
  
  Future _getUserInfo()async{
    DocumentSnapshot document = await _cloud.getUserData(userId);
    if (document.exists) {
      var data = document.data() as Map<String, dynamic>?;

      if (data != null) {
        setState(() {
          firstnameController.text = data['firstname'] ?? '';
          secondnameController.text = data['secondname'] ?? '';
          ageController.text = (data['age'] ?? 0).toString();
          numberController.text = (data['phone_number'] ?? '').toString();
        });
      }
    } 
  }
 

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      _getUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Профиль'),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            }, 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      resizeToAvoidBottomInset:true,
      body: SingleChildScrollView(
        child: Padding(
          padding: a16,
          child: Align(
            child: Padding(
              padding: t40,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,  
                    children: [
                      const CircleAvatar(
                        backgroundColor: white,
                        radius: 70, 
                        backgroundImage: AssetImage('assets/icons/user.png'),  
                      ),
                      Positioned(   
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(color : purple,Icons.create_rounded),
                        ),
                      ),
                    ],
                  ),
                  MyTextField(
                    labelText: 'Имя',
                    controller: firstnameController,
                  ),
                  MyTextField(
                    labelText: 'Фамилия',
                    controller: secondnameController,
                  ),
                  MyTextField(
                    labelText: 'Возраст',
                    controller: ageController,
                    keyboardType: TextInputType.number
                  ),
                  MyTextField(
                    labelText: 'Номер телефона',
                    controller: numberController,
                    keyboardType: TextInputType.phone
                  ),
                  MyButton(
                    borderColor: purple,
                    color: purple,
                    text: "Сохранить", 
                    textColor: white,
                    onTap: (){
                      _saveUserInfo(firstnameController.text, secondnameController.text, int.parse(ageController.text), int.parse(numberController.text));
                    },
                    fw: w600,font_s: 16,
                 ),
                const SizedBox(height: 10,),
                const Text('График работы: пн–пт, 10.00–19.00\nТелефон: +7 (343) 385–90–10',style: bf16w4,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
