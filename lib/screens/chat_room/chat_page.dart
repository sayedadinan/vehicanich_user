import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/data/services/chat_services/chat_services.dart';
import 'package:vehicanich/utils/app_textfields.dart';

class ChatPage extends StatelessWidget {
  final String receiverUserPhone;
  final String receiverUserID;
  ChatPage(
      {super.key,
      required this.receiverUserPhone,
      required this.receiverUserID});
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverUserID, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Expanded(child: buildMessageList()), buildMessageInput()],
      ),
    );
  }

  buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: Inputfield(
          hinttext: 'Enter message',
          controller: messageController,
        )),
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              size: 30,
            ))
      ],
    );
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        children: [Text(data['senderEmail']), Text(data['message'])],
      ),
    );
  }

  buildMessageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
          receiverUserID, firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => buildMessageItem(document))
              .toList(),
        );
      },
    );
  }
}
