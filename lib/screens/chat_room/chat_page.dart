import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/data/services/chat_services/chat_services.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/chat_room/chat_bubble.dart';
import 'package:intl/intl.dart';

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
  sendMessages() async {
    if (receiverUserID.isNotEmpty && messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverUserID, messageController.text);
      messageController.clear();
    } else {
      print('Error: receiverUserID is null or message is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Myappallcolor().appbarbackgroundcolor,
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          buildMessageInput(context)
        ],
      ),
    );
  }

  buildMessageInput(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Mymediaquery().mediaqueryheight(0.03, context)),
      child: Row(
        children: [
          Expanded(
            child: Inputfield(
              hinttext: 'Enter message',
              controller: messageController,
            ),
          ),
          IconButton(
              onPressed: sendMessages,
              icon: Icon(
                Icons.send,
                size: 30,
                color: Myappallcolor().colorwhite,
              ))
        ],
      ),
    );
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    Timestamp timestamp = data['timestamp'] as Timestamp;
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.jm().format(dateTime);

    return Container(
      alignment: alignment,
      child: Column(
        children: [
          ChatBubble(
            isCurrentUser: (data['senderId'] == firebaseAuth.currentUser!.uid),
            time: formattedTime,
            message: data['message'],
          )
        ],
      ),
    );
  }

  buildMessageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
        receiverUserID,
        firebaseAuth.currentUser!.uid,
      ),
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
