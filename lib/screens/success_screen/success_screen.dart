import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/total_bill/bloc/total_bill_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';

class SuccessScreen extends StatelessWidget {
  final String shopId;
  final String vehicleNumber;
  final String serviceName;
  const SuccessScreen(
      {Key? key,
      required this.shopId,
      required this.vehicleNumber,
      required this.serviceName});

  @override
  Widget build(BuildContext context) {
    // Navigate to home screen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      context.read<TotalBillBloc>().add(MoneyAddeddSuccess(
          shopId: shopId,
          serviceName: serviceName,
          vehicleNumber: vehicleNumber));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomBar()),
        (route) => false,
      );
    });

    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: const Center(
        child: AppText(text: 'Your payment Successfull', size: 0.09),
      ),
    );
  }
}
