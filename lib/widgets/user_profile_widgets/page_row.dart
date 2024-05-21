import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ProfilePageRow extends StatelessWidget {
  final String mainText;
  final String valueText;
  const ProfilePageRow({
    super.key,
    required this.mainText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaquerywidth(0.06, context),
          right: Mymediaquery().mediaquerywidth(0.06, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(child: AppText(text: mainText, size: 0.04)),
          const CustomSizedBoxWidth(0.08),
          AppText(text: valueText, size: 0.04),
        ],
      ),
    );
  }
}
