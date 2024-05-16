part of 'payment_bloc.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String amount;

  PaymentSuccess({required this.amount});
}

class PaymentFailed extends PaymentState {}
