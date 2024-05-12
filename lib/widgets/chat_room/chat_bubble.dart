import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Myappallcolor().appbarbackgroundcolor),
        child: Text(
          message,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
