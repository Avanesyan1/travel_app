import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/global/const.dart';

class Send_Message_Page extends StatefulWidget {
  const Send_Message_Page({super.key});

  @override
  State<Send_Message_Page> createState() => _Send_Message_Page();
}

class _Send_Message_Page extends State<Send_Message_Page> {
  
  @override
  
  Widget build(BuildContext context) {
     // Получение данных
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сброс пароля',style: bf20w7,),
        centerTitle: true,
      ),
      body: Padding(
        padding: a16,
        child: Column(
          mainAxisAlignment: spb,
          children: [
            Column(
                        children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset('assets/images/reset_password_icon.png'),
              ),
              const Center(
                child: Text('Мы отправили электронное письмо на адрес '),
              ),
              Center(
                child: Text('$args с инструкциями'),
              ),
              const Center(
                child: Text('по сбросу пароля.'),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: tb10,
                child: MyButton(
                    borderColor: purple,
                    color: purple,
                    text: "Вернуться на страницу входа", 
                    textColor: white,
                    onTap: (){
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    fw: w600,font_s: 16,
                 ),
              ),
                        ],
                      ),
            const Column(
              children: [
                Text('Используя приложение , вы соглашаетесь с',style: g2f14w4,),
                Center(child: Text('условиями и политикой конфиденциальности.',style: g2f14w4,))
              ],
            )
        ]),
      ));
  }
}