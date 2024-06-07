import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ListtileText extends StatelessWidget {
  final String shopname;
  final String phone;
  final String startingtime;
  final String closingtime;
  final String shoplocation;
  const ListtileText({
    super.key,
    required this.shopname,
    required this.phone,
    required this.startingtime,
    required this.closingtime,
    required this.shoplocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBoxHeight(0.008),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.49, context),
          child: AppText(
            text: shopname,
            size: 0.056,
          ),
        ),
        const CustomSizedBoxHeight(0.003),
        Row(
          children: [
            AppSemiText(
              text: shoplocation,
              size: 0.034,
              // weight: FontWeight.w100,
            )
          ],
        ),
        const CustomSizedBoxHeight(0.009),
        Row(
          children: [
            AppSemiText(text: startingtime, size: 0.03),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
            const AppSemiText(text: 'to', size: 0.03),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
            AppSemiText(text: closingtime, size: 0.03),
          ],
        ),
        const CustomSizedBoxHeight(0.02),
      ],
    );
  }
}
