import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ListtileText extends StatelessWidget {
  final String shopname;
  final String phone;
  final String startingtime;
  final String closingtime;
  const ListtileText({
    super.key,
    required this.shopname,
    required this.phone,
    required this.startingtime,
    required this.closingtime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          shopname,
          style: TextStyle(
              color: Myappallcolor().colorwhite,
              fontWeight: FontWeight.w300,
              fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
        ),
        Text(
          phone,
          style: TextStyle(
              color: Myappallcolor().colorwhite,
              fontWeight: FontWeight.w400,
              fontSize: Mymediaquery().mediaquerywidth(0.01, context)),
        ),
        SizedBox(height: Mymediaquery().mediaquerywidth(0.01, context)),
        Row(
          children: [
            Text(
              startingtime,
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontWeight: FontWeight.w300,
                  fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
            ),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
            Text(
              'to',
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontWeight: FontWeight.w400,
                  fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
            ),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
            Text(
              closingtime,
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontWeight: FontWeight.w300,
                  fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
            ),
          ],
        ),
      ],
    );
  }
}
