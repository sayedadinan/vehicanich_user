import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomAppbarForProfile extends StatelessWidget {
  final String text;
  const CustomAppbarForProfile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(
            top: Mymediaquery().mediaqueryheight(0.02, context)),
        child: Text(
          text,
          style: TextStyle(
              color: Myappallcolor().colorwhite,
              fontSize: Mymediaquery().mediaqueryheight(0.04, context)),
        ),
      ),
      toolbarHeight: Mymediaquery().mediaqueryheight(0.10, context),
      backgroundColor: Myappallcolor().appbarbackgroundcolor,
    );
  }
}
