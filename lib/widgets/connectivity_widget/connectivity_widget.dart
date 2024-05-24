import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: Column(
        children: [
          const CustomSizedBoxHeight(0.16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  'assets/images/nonetworkImage.png',
                ),
              ),
            ],
          ),
          const AppText(
            text: 'Oops ! some thing went wrong',
            size: 0.06,
            weight: FontWeight.bold,
          ),
          const AppText(
            text: 'please check your internet connection',
            size: 0.04,
            weight: FontWeight.normal,
          )
        ],
      ),
    );
  }
}
