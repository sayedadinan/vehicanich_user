import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class totalDetailsRow extends StatelessWidget {
  final String keytext;
  final String valueText;
  const totalDetailsRow({
    super.key,
    required this.keytext,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSizedBoxHeight(0.03),
        SizedBox(
            width: Mymediaquery().mediaquerywidth(0.33, context),
            child: AppText(text: keytext, size: 0.05)),
        const CustomSizedBoxWidth(0.06),
        SizedBox(
            width: Mymediaquery().mediaquerywidth(0.4, context),
            child: AppText(text: valueText, size: 0.05)),
      ],
    );
  }
}
