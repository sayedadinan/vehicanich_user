import 'package:flutter/material.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final FontWeight? weight;

  const AppText({
    super.key,
    required this.text,
    required this.size,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Oswald',
        fontWeight: weight,
        fontSize: Mymediaquery().mediaquerywidth(size, context),
        color: Colors.white,
      ),
    );
  }
}
