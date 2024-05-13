import 'package:flutter/material.dart';

class CustomSizedBoxHeight extends StatelessWidget {
  final double height;

  CustomSizedBoxHeight(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
    );
  }
}

class CustomSizedBoxWidth extends StatelessWidget {
  final double width;

  CustomSizedBoxWidth(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
    );
  }
}
