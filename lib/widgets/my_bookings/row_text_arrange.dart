import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Rowforcontainer extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const Rowforcontainer(
      {super.key, required this.valuetext, required this.keytext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.32, context),
          child: Text(
            keytext,
            style: TextStyle(
                color: Myappallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: Mymediaquery().mediaquerywidth(0.03, context),
            color: Myappallcolor().textcolor,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.04, context)),
            child: SizedBox(
              width: Mymediaquery().mediaquerywidth(0.4, context),
              child: AppText(text: valuetext, size: 0.04),
              // child: Text(
              //   valuetext,
              //   style: TextStyle(
              //       color: Myappallcolor().colorwhite,
              //       fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
              // ),
            )),
      ],
    );
  }
}

class RowforBookingsInside extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const RowforBookingsInside(
      {super.key, required this.valuetext, required this.keytext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.06, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.43, context),
          child: Text(
            keytext,
            style: TextStyle(
                color: Myappallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 20,
            color: Myappallcolor().textcolor,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.04, context)),
            child: Text(
              valuetext,
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
            )),
      ],
    );
  }
}
