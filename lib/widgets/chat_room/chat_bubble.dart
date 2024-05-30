import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Myappallcolor().appbarbackgroundcolor,
            ),
            child: Text(
              message,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
