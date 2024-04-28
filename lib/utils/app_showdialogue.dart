import 'package:flutter/material.dart';

class CustomShowdialogue {
  static void showCustomDialog(BuildContext context,
      {required String title,
      required String message,
      required DialogType type}) {
    IconData iconData;
    Color iconColor;

    // Determine icon and color based on dialog type
    switch (type) {
      case DialogType.success:
        iconData = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case DialogType.error:
        iconData = Icons.error;
        iconColor = Colors.red;
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              const SizedBox(width: 5),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

enum DialogType { success, error }
