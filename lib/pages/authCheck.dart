import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/auth_pages/first_page.dart';
import 'package:travel_app/pages/roleCheck.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snpashot){
        if (snpashot.hasData) {
          return  RoleCheck();
        } else {
          return const First_Page();
        }
      }
      );
  }
}