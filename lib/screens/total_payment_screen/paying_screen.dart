import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/app_theme.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class PaymentScreen extends StatelessWidget {
  final String amount;
  const PaymentScreen({key, required this.amount}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Myappallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: Center(
        child: Container(
          height: Mymediaquery().mediaqueryheight(0.3, context),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Myappallcolor().bookingCardColor,
            borderRadius: BorderRadius.circular(MyAppTheme.borderRadiusValue),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomSizedBoxHeight(0.05),
              const AppText(text: 'You are paying now', size: 0.04),
              const CustomSizedBoxHeight(0.02),
              AppText(text: '₹$amount', size: 0.1),
              const CustomSizedBoxHeight(0.01),
              SizedBox(
                width: Mymediaquery().mediaquerywidth(0.37, context),
                height: Mymediaquery().mediaqueryheight(0.05, context),
                child: CustomButton(
                  color: Myappallcolor().buttonforgroundcolor,
                  function: () {},
                  text: "pay",
                  fontSize: Mymediaquery().mediaquerywidth(0.07, context),
                  buttontextcolor: Myappallcolor().colorwhite,
                  bordercolor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
