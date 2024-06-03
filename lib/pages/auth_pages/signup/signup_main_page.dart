import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/buttons/iconbutton.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/auth_service.dart';

class Signup_Main_Page extends StatefulWidget {
  const Signup_Main_Page({super.key});

  @override
  State<Signup_Main_Page> createState() => _Signup_Main_PageState();
}

class _Signup_Main_PageState extends State<Signup_Main_Page> {

   //inite
  final AuthService _auth = AuthService();
  
  //login with google
  void _login_with_google()async{
   try {
    UserCredential? user = await _auth.signInWithGoogle();
   
    if(user == null){
      throw Exception('неудалось войти');
    }
    Navigator.pushReplacementNamed(context, 'home');
   } 

   catch (e) {
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar: AppBar(
        title: const Text('Создать новый аккаунт',style: bf20w7,),
        centerTitle: true,
      ),
      body: Padding(
        padding: a16,
        child: Column(
          mainAxisAlignment: spb,
          children: [
            Column(
          children: [
            const Center(child: Text('Начните с создания новой бесплатной',style: g1f16w4,)),
            const Center(child: Text('учетной записи.',style: g1f16w4,)),
            Padding(
              padding: tb10,
              child: MyButton(
                borderColor: purple,
                color: purple,
                textColor: white,
                text: "Продолжить по электронной почте", 
                onTap: (){
                Navigator.pushNamed(context, 'signup');
              }, 
              fw: w600,font_s: 16,),
            ),
            const Center(child: Text('или',style: bf16w4)),
            Padding(
              padding: tb10,
              child: MyIconButton(
                fontSize: 16,
                icon: "assets/icons/google.png",
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
              ),
            ])
        ),
      );
  }
}