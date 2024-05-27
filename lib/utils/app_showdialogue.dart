import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';

class CustomShowdialogue {
  static void showCustomDialog(
    BuildContext context, {
    required String title,
    required String message,
    required DialogType type,
    bool showSecondButton = false, // Optional parameter to show second button
    String?
        secondButtonText, // Optional parameter for the text of the second button
    VoidCallback?
        onSecondButtonPressed, // Optional parameter for the onPressed callback of the second button
  }) {
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
          backgroundColor: Myappallcolor().bookingCardColor,
          title: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              const SizedBox(width: 5),
              AppText(text: title, size: 0.06)
            ],
          ),
          content: AppText(text: message, size: 0.04),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            // Conditionally show the second button based on the 'showSecondButton' parameter
            if (showSecondButton &&
                secondButtonText != null &&
                onSecondButtonPressed != null)
              TextButton(
                onPressed: onSecondButtonPressed,
                child: Text(secondButtonText),
              ),
          ],
        );
      },
    );
  }
}

enum DialogType { success, error }
