import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/widgets/textField/textField.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/service/auth_service.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  
  //inite
  final AuthService _auth = AuthService();
  
  // get textfield input text
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  //login 
  void _login(String email, String password)async{
   try {
    User? user = await _auth.signInWithEmailAndPassword(email,password);
   
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
            MyTextField(
              controller: _emailController,
              labelText: "Email",
            ),
            MyTextField(
              controller: _passwordController,
              labelText: "Введитье пароль",
            ),
            MyButton(
                borderColor: purple,
                color: purple,
                text: "Войти", 
                textColor: white,
                onTap: (){
                  _login(_emailController.text, _passwordController.text);
                  
                },
                fw: w600,font_s: 16,
             ),
          
            Center(
              child: TextButton(
                onPressed: () {
                  _login(_emailController.text, _passwordController.text);
                  Navigator.pushNamed(context, 'reset_password');
                },
                child: const Text('Забыле пароль ?',style: bf14w6,),
              ),
            )
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