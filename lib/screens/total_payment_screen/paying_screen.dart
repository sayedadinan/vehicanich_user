import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/payment_blocs/bloc/payment_bloc.dart';
import 'package:vehicanich/blocs/total_bill/bloc/total_bill_bloc.dart';
import 'package:vehicanich/screens/success_screen/success_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/app_theme.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class PaymentScreen extends StatelessWidget {
  final String amount;
  final String shopId;
  final String serviceName;
  final String vehicleNumber;
  const PaymentScreen(
      {super.key,
      required this.amount,
      required this.shopId,
      required this.serviceName,
      required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state is PaymentLoading) {
          return loader;
        }
        if (state is PaymentSuccess) {
          context
              .read<TotalBillBloc>()
              .add(AddMoneyToWallet(amount: amount, shopId: shopId));
          context.read<TotalBillBloc>().add(MoneyAddeddSuccess(
              shopId: shopId,
              serviceName: serviceName,
              vehicleNumber: vehicleNumber));
          log('success state ');
          return SuccessScreen(
            serviceName: serviceName,
            vehicleNumber: vehicleNumber,
            shopId: shopId,
          );
        }
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
                borderRadius:
                    BorderRadius.circular(MyAppTheme.borderRadiusValue),
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
                      function: () {
                        context
                            .read<PaymentBloc>()
                            .add(PaymentButtonPressed(amount: amount));
                        log('worked');
                      },
                      text: "pay",
                      fontSize: 0.07,
                      buttontextcolor: Myappallcolor().colorwhite,
                      bordercolor: Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
