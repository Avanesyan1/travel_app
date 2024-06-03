import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/password_conditions/password_condition.dart';
import 'package:travel_app/widgets/textField/textField.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/auth_service.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {

  String password = '';

  bool get passwordHasValidLength => password.length > 8;
  bool get passwordHasLetter => password.contains(RegExp(r'[a-zA-Z]'));
  bool get passwordHasNumber => password.contains(RegExp(r'[0-9]'));
  
   //inite
  final AuthService _auth = AuthService();
  
  // get textfield input text
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  //login 
  void _signup(String email, String password)async{
   try {
    User? user = await _auth.registerWithEmailAndPassword(email,password);
   
    if(user == null){
      throw Exception('неудалось войти');
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, 'home');
   } 
   catch (e) {
     // ignore: avoid_print
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar: AppBar(
        title: const Text('Регистрация',style: bf20w7,),
        centerTitle: true,
      ),
      body: Padding(
        padding: a16,
        child: Column(
          mainAxisAlignment: spb,
          children: [
            Column(
          children: [
            MyTextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              controller: _emailController,
              labelText: "Почта",
            ),
             Column(
          mainAxisAlignment: spb,
          children: [
            Column(
          children: [
            MyTextField(
              controller: _passwordController,
              onChanged: (value) {
          setState(() {
            password = value;
          });},
              labelText: "Пароль",
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PasswordCondition(
                conditionMet: _passwordController.text.length > 8,
                condition: 'Минимум 8 символов',
              ),
              // ...
            ],
          ),
            MyButton(
                borderColor: purple,
                color: purple,
                text: "Создать аккаунт", 
                textColor: white,
                onTap: (){
                  _signup(_emailController.text,_passwordController.text);
                },
                fw: w600,font_s: 16,
             ),
          ],
        ),
           
          ],
        ),
      
      ]
    ),
     const Column(
              children: [
                Text('Используя приложение, вы соглашаетесь с',style: g2f14w4,),
                Center(child: Text('условиями и политикой конфиденциальности.',style: g2f14w4,))
              ],
            ),
  ])));
}
}