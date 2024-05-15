import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
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
          child: Text(
            text,
            style: TextStyle(
                color: Myappallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
          ),
        )
      ],
    );
  }
}
