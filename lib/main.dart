import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/authCheck.dart';
import 'package:travel_app/pages/auth_pages/login/login_main_page.dart';
import 'package:travel_app/pages/auth_pages/login/login_page.dart';
import 'package:travel_app/pages/auth_pages/login/reset_password_page.dart';
import 'package:travel_app/pages/auth_pages/login/send_message_page.dart';
import 'package:travel_app/pages/auth_pages/signup/account_created_page.dart';
import 'package:travel_app/pages/auth_pages/signup/signup_main_page.dart';
import 'package:travel_app/pages/auth_pages/signup/signup_page.dart';
import 'package:travel_app/pages/home_pages/home_page.dart';
import 'package:travel_app/pages/roleCheck.dart';
import 'package:travel_app/service/pushNotification_service.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDWRSsT6tN1ra_sz8_Ld_dP-jahSGsdNBE",
      appId: "1:343500358490:android:a7f2e528fb5fd06f85e963",
      messagingSenderId: "343500358490",
      projectId: "travel-app-a360b",
    ),
  );
  // Initialize push notification service
  PushNotificationService firebaseMessagingService = PushNotificationService();
  await firebaseMessagingService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: '/',
      routes: {
        'login_main': (context) => const Login_Main_Page(),
        'login': (context) => const Login_Page(),
        'reset_password': (context) => const Reset_Password_Page(),
        'send_message': (context) => const Send_Message_Page(),
        'signup_main': (context) => const Signup_Main_Page(),
        'signup': (context) => const Signup_Page(),
        'account_created': (context) => const Account_Created_Page(),
        'home': (context) => const Home_Page(),
        'roleCheck': (context) => RoleCheck(),
        '/': (context) => const AuthCheck(),
      },
    );
  }
}