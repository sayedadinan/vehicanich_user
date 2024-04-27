import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ListtileText extends StatelessWidget {
  const ListtileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: Mymediaquery().mediaqueryheight(0.03, context),
        ),
        Text(
          'Apollo Works',
          style: TextStyle(
              color: Myappallcolor().colorblack,
              fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
        ),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
        Text(
          'Calicut, Feroke',
          style: TextStyle(
              color: Myappallcolor().colorblack,
              fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
        ),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
        Text(
          '9am to 8pm',
          style: TextStyle(color: Myappallcolor().colorblack),
        ),
      ],
    );
  }
}
