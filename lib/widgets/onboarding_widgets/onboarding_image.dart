import 'package:flutter/material.dart';

class Onboardingfirstimage extends StatelessWidget {
  final String path;
  const Onboardingfirstimage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.contain,
      ),
    );
  }
}
