import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_text.dart';
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
        const AppText(
          text: detailspricedescription,
          size: 0.03,
        )
      ],
    );
  }
}
