import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Forgetbutton extends StatelessWidget {
  final Function() function;
  const Forgetbutton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.3, context),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Myappallcolor().textcolor),
          ),
        ),
      ],
    );
  }
}
