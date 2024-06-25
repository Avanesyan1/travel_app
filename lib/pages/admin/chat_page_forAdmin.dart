import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/widgets/textField/textField.dart';

class ChatPageforAdmin extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String auth; 

  ChatPageforAdmin({super.key, required this.auth});

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('chats').add({
        'text': _controller.text,
        'createdAt': Timestamp.now(),
        'userId': auth,
        'role': 'Admin'
      });
      _controller.clear();
    }
  }

  String formatTimestamp(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Чат с поддержкой'),
      ),
      body: Column(
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
      
                // Фильтрация сообщений текущего пользователя
                final userMessages = chatDocs.where((doc) => doc['userId'] == auth);
      
                return ListView.builder(
                  reverse: true,
                  itemCount: userMessages.length,
                  itemBuilder: (ctx, index) {
                    final chatData = userMessages.elementAt(index);
                    final message = chatData['text'];
                    final timestamp = chatData['createdAt'] as Timestamp;
                    final role = chatData['role'];
                    final formattedTime = formatTimestamp(timestamp);
                    final isAdmin = role == 'Admin';
      
                    return ListTile(
                      title: Align(
                        alignment: isAdmin ? Alignment.centerRight : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isAdmin ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(message),
                            const SizedBox(height: 5),
                            Text(
                              '$role $formattedTime',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyTextField(
                    controller: _controller,
                    labelText: 'Отправить сообщение',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
