import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/pages/admin/chat_page_forAdmin.dart';
import 'package:travel_app/widgets/buttons/button.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Чаты с пользователями'),
      ),
      body: Padding(
        padding: a16,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                  if (chatSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final chatDocs = chatSnapshot.data!.docs;
        
                  Set<String> uniqueUserIds = Set<String>.from(
                    chatDocs.map((doc) => doc['userId'] as String)
                  );
        
                  return ListView(
                    children: uniqueUserIds.map((userId) {
                      return FutureBuilder(
                        future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
                        builder: (ctx, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                          if (userSnapshot.connectionState == ConnectionState.waiting) {
                            return const SizedBox();  
                          }
                          if (!userSnapshot.hasData || userSnapshot.data!.data() == null) {
                            return const SizedBox();  
                          }
                          final userData = userSnapshot.data!.data() as Map<String, dynamic>;
                          final userName = userData['firstname'] ?? 'Имя не указано'; 
        
                          return ListTile(
                            title: Text(userName),
                            subtitle: Text(userId),  
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPageforAdmin(auth: userId),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          MyButton(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            }, 
            text: 'Выйти', 
            fw: w400, 
            textColor: white, 
            font_s: 16, 
            color: purple, 
            borderColor: purple
            )
          ],
        ),
      ),
      
    );
  }
}
