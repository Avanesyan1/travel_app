// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/button.dart';
import 'package:travel_app/global/const.dart';

class Account_Created_Page extends StatefulWidget {
  const Account_Created_Page({super.key});

  @override
  State<Account_Created_Page> createState() => _Account_Created_Page();
}

class _Account_Created_Page extends State<Account_Created_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: a16,
        child: Center(
          child: Column(
            mainAxisAlignment: spb,
            children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
                    child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Image.asset('assets/images/created_icon.png'),
                      ),
                      const Center(child: Text('Ваш аккаунт ',style: g1f24w7,)),
                      const Center(child: Text('был успешно создан!.',style: g1f24w7,)),
                      const SizedBox(height: 10,),
                      const Center(child: Text('Всего один клик,',style: g1f16w4,)),
                      const Center(child: Text('чтобы изучить онлайн-образование !',style: g1f16w4,)),
                    Padding(
                      padding: tb10,
                      child: MyButton(
                        borderColor: purple,
                        color: purple,
                        textColor: white,
                        text: "Войти", 
                        onTap: (){
                        Navigator.pushReplacementNamed(context, 'login');
                      }, 
                      fw: w600,font_s: 16,),
                    ),
                              ],
                            ),
                  ),
              const Column(
                children: [
                  Text('Используя Класс, вы соглашаетесь с',style: g2f14w4,),
                  Center(child: Text('Условиями и Политикой конфиденциальности.',style: g2f14w4,))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}