import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomizedText extends StatelessWidget {
  final String text;
  const CustomizedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.08, context)),
            child: AppText(text: text, size: 0.05))
      ],
    );
  }
}
