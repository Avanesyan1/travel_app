// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/textField/textField.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/auth_service.dart';

class Reset_Password_Page extends StatefulWidget {
  const Reset_Password_Page({super.key});

  @override
  State<Reset_Password_Page> createState() => _Reset_Password_Page();
}

class _Reset_Password_Page extends State<Reset_Password_Page> {

  //inite
  final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();

  void reset_password(String email) async{
   try {
     await _authService.sendPasswordResetEmail(email);
     Navigator.pushNamed(arguments:email ,context, 'send_message');
   } catch (e) {
     print(e);
   }
  }
  @override
  Widget build(BuildContext context) {
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
            const Center(
              child: Text('Мы отправим вам по электронной почте'),
            ),
            const Center(
              child: Text('ссылку для сброса пароля.'),
            ),
            MyTextField(
              controller: _emailController,
              labelText: "Email",
            ),
            MyButton(
                borderColor: purple,
                color: purple,
                text: "Отправить", 
                textColor: white,
                onTap: (){
                  reset_password(_emailController.text);
                },
                fw: w600,font_s: 16,
             ),
          ],
        ),
            const Column(
              children: [
                Text('Используя приложение , вы соглашаетесь с',style: g2f14w4,),
                Center(child: Text('условиями и политикой конфиденциальности.',style: g2f14w4,))
              ],
            )
          ],
        ),
      )
    );
  }
}