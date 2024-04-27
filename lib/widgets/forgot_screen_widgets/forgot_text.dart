import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Forgotpagetexts extends StatelessWidget {
  final double fontsize;
  final String text;
  final FontWeight? fontweight;
  const Forgotpagetexts(
      {super.key, required this.fontsize, required this.text, this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.03, context),
        ),
        Text(text,
            style: TextStyle(
                color: Myappallcolor().textcolor,
                fontSize: fontsize,
                fontWeight: fontweight))
      ],
    );
  }
}
