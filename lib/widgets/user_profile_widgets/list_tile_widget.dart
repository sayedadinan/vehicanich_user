import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ProfileList extends StatelessWidget {
  final String text;
  final IconData icon;
  const ProfileList({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      child: Padding(
        padding: EdgeInsets.only(
            left: Mymediaquery().mediaquerywidth(0.04, context),
            right: Mymediaquery().mediaquerywidth(0.04, context)),
        child: Card(
          elevation: 10,
          color: Myappallcolor().appbackgroundcolor,
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  color: Myappallcolor().textcolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
              width: Mymediaquery().mediaquerywidth(0.12, context),
              height: Mymediaquery().mediaqueryheight(0.05, context),
              child: Icon(
                icon,
                color: Myappallcolor().textcolor,
              ),
            ),
            title: AppText(text: text, size: 0.04),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Myappallcolor().textcolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
              width: Mymediaquery().mediaquerywidth(0.07, context),
              height: Mymediaquery().mediaqueryheight(0.03, context),
              child: Icon(Icons.arrow_forward_ios,
                  size: 20, color: Myappallcolor().textcolor),
            ),
          ),
        ),
      ),
    );
  }
}
