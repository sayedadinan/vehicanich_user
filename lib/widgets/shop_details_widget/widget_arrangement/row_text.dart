import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/widgets/shop_details_widget/widget_arrangement/shop_details_textarrangement.dart';

class RowTexts extends StatelessWidget {
  final String text;
  const RowTexts({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSizedBoxWidth(0.10),
        DetailsPageTitleText(titletext: text),
      ],
    );
  }
}
