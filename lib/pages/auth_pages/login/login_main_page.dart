// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/buttons/iconbutton.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/auth_service.dart';

class Login_Main_Page extends StatefulWidget {
  const Login_Main_Page({super.key});

  @override
  State<Login_Main_Page> createState() => _Login_Main_PageState();
}

class _Login_Main_PageState extends State<Login_Main_Page> {
  
  //inite
  final AuthService _auth = AuthService();
  
  //login with google
  void _login_with_google()async{
   try {
    UserCredential? user = await _auth.signInWithGoogle();

    if(user == null){
      throw Exception('неудалось войти');
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, 'home');
   } 

   catch (e) {
     // ignore: avoid_print
     print(e);
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войти в аккаунт',style: bf20w7,),
        centerTitle: true,
      ),
      body: Padding(
        padding: a16,
        child: Column(
          mainAxisAlignment: spb,
          children: [
            Column(
          children: [
            const Center(child: Text('Добро пожаловать!',style: g1f16w4,)),
            const Center(child: Text('Давайте продолжим обучение',style: g1f16w4,)),
            Padding(
              padding: tb10,
              child: MyButton(
                borderColor: purple,
                color: purple,
                textColor: white,
                text: "Продолжить по электронной почте", 
                onTap: (){
                Navigator.pushNamed(context, 'login');
              }, 
              fw: w600,font_s: 16,),
            ),
            const Center(child: Text('или',style: bf16w4)),
            Padding(
              padding: tb10,
              child: MyIconButton(
                fontSize: 14,
                icon: 'assets/icons/google.png',
                borderColor: black,
                color: white,
                text: "Продолжить с Google", 
                onTap: (){
                  _login_with_google();
                }, 
                textColor: black,
                fw: w500,
                font_s: 14,),
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