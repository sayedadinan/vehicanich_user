part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final UserModel user;

  SignUpButtonPressed({required this.user});
}
