import 'package:flutter/widgets.dart';

sealed class ForgotButtonEvent {}

class SendCodeButtonPressed extends ForgotButtonEvent {
  final TextEditingController emailcontroller;

  SendCodeButtonPressed({required this.emailcontroller});
}
