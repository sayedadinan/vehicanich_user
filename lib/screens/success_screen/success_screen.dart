import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: const Center(
        child: Text('Success'),
      ),
    );
  }
}
