import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/splash_funtions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkingforsplash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: const Center(
        child: Column(
          children: [
            CustomSizedBoxHeight(0.42),
            AppText(
              text: 'VEHICANICH',
              size: 0.17,
              weight: FontWeight.w400,
            ),
            CustomSizedBoxHeight(0.001),
            Row(
              children: [
                CustomSizedBoxWidth(0.38),
                AppText(
                  text: 'Make your car perfect',
                  size: 0.06,
                  weight: FontWeight.w200,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
