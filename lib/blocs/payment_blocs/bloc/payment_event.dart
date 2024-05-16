part of 'payment_bloc.dart';

sealed class PaymentEvent {}

class PaymentButtonPressed extends PaymentEvent {
  final String amount;

  PaymentButtonPressed({required this.amount});
}
