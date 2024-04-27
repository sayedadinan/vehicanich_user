import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Customquestion extends StatelessWidget {
  const Customquestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.12, context),
        ),
        Text(
          "Didn't received code? ",
          style: TextStyle(color: Myappallcolor().textcolor),
        ),
        Text(
          ' Resend',
          style: TextStyle(color: Myappallcolor().buttonforgroundcolor),
        )
      ],
    );
  }
}
