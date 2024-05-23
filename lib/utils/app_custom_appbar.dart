import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomAppbar extends StatelessWidget {
  final String appbartext;
  const CustomAppbar({super.key, required this.appbartext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Myappallcolor().appbarbackgroundcolor,
          borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(36),
              bottomStart: Radius.circular(36))),
      width: double.infinity,
      height: Mymediaquery().mediaqueryheight(0.38, context),
      child: Padding(
        padding: EdgeInsets.only(
            left: Mymediaquery().mediaquerywidth(0.18, context),
            top: Mymediaquery().mediaqueryheight(0.12, context)),
        child: SizedBox(
            width: Mymediaquery().mediaquerywidth(0.2, context),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.09, context)),
              child: AppText(
                text: appbartext,
                size: 0.07,
                weight: FontWeight.w600,
              ),
            )),
      ),
    );
  }
}
