import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:vehicanich/data/services/payment_services/make_payment.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentButtonPressed>(paymentButtonTap);
  }
  paymentButtonTap(
      PaymentButtonPressed event, Emitter<PaymentState> emit) async {
    try {
      emit(PaymentLoading());
      log('worked this bloc');
      double convertedMoney = double.parse(event.amount);
      log(convertedMoney.toString());
      int amount = convertedMoney.toInt();
      await initPaymentSheet(amount: amount.toString());
      await Stripe.instance.presentPaymentSheet();
      log('successed');
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailed());
    }
  }
}

Future<void> initPaymentSheet({required String amount}) async {
  try {
    final data = await createPaymentIntent(
        name: 'Sayed Adinan',
        pin: '673682',
        city: 'manjeri',
        state: 'MA',
        amount: amount,
        address: "makkattu parambil");
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      // Set to true for custom flow
      customFlow: false,
      // Main params
      merchantDisplayName: 'Flutter Stripe Store Demo',
      paymentIntentClientSecret: data['client_secret'],
      // Customer keys
      customerEphemeralKeySecret: data['ephemeralKey'],
      customerId: data['id'],
      style: ThemeMode.light,
    ));
    log('data added');
  } catch (e) {
    log('there is a error $e');
    rethrow;
  }
}
