import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

class PriceAdditionalText extends StatelessWidget {
  const PriceAdditionalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
        Text(
          detailspricedescription,
          style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Myappallcolor().colorwhite,
              fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
        )
      ],
    );
  }
}
