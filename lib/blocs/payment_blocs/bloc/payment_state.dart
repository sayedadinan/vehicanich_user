part of 'payment_bloc.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  PaymentSuccess();
}

class PaymentFailed extends PaymentState {}
