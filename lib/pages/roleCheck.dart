import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/admin/chats_list_page.dart';
import 'package:travel_app/pages/home_pages/home_page.dart';
import 'package:travel_app/service/cloud_service.dart';

class RoleCheck extends StatelessWidget {
  final CloudService _cloudService = CloudService();

  RoleCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _cloudService.getRole(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == 'admin') {
          return const ChatListPage();
        } else {
          return const Home_Page();
        }
      },
    );
  }
}
