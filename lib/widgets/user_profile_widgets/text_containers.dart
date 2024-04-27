import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Mymediaquery().mediaquerywidth(0.45, context),
      height: Mymediaquery().mediaqueryheight(0.07, context),
      decoration: BoxDecoration(
        color: Myappallcolor().textcolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: Mymediaquery().mediaqueryheight(0.02, context),
            left: Mymediaquery().mediaquerywidth(0.03, context)),
        child: Text(
          text,
          style: TextStyle(
            color: Myappallcolor().colorblack,
            fontSize: Mymediaquery().mediaquerywidth(0.02, context),
          ),
        ),
      ),
    );
  }
}
