import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Forgetbutton extends StatelessWidget {
  final Function() function;
  const Forgetbutton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: Mymediaquery().mediaquerywidth(0.05, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: function,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Myappallcolor().textcolor,
                  fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
            ),
          ),
        ],
      ),
    );
  }
}
