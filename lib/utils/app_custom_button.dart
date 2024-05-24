import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Function() function;
  final String text;
  final double fontSize;
  final Color buttontextcolor;
  final Color bordercolor;
  const CustomButton({
    super.key,
    required this.color,
    required this.function,
    required this.text,
    required this.fontSize,
    required this.buttontextcolor,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Mymediaquery().mediaquerywidth(0.9, context),
      height: Mymediaquery().mediaqueryheight(0.07, context),
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor),
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          function(); // Invoke the function here
        },
        child: Center(child: AppText(text: text, size: fontSize)),
      ),
    );
  }
}
