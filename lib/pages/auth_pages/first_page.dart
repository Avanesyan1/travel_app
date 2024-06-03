// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/global/const.dart';

class First_Page extends StatelessWidget {
  const First_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: a16,
        child: Column(
            mainAxisAlignment: spb,
            children: [
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    child: Image.asset(
                       'assets/images/bird.png',
                        height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  ),
                  const Column(
                    children: [
                     Text('Детское Бюро',style: bf32w4,),
                     Text('Путшествий ',style: bf32w4,),
                    ],
                  ),
                  const Column(
                    children: [
                  Text('Мы профессионально организуем',style: bf16w6,),
                  Text('увлекательный и безопасный отдых',style: bf16w6,),
                  Text('в России и за рубежом',style: bf16w6,),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MyButton(
                      borderColor: purple,
                      color: purple,
                      onTap: () {
                          Navigator.pushNamed(context, 'signup_main');
                      },
                      fw: w600,
                      textColor: white,
                      font_s: 16,
                      text: 'Создать аккаунт', 
                      ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: cnt,
                      children: [
                        const Text('У вас уже есть аккаунт ?',style: bf16w4,),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'login_main');
                          }, 
                          child: const Text('Войдите !',style: bf16w6,))
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}