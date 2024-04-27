part of 'login_bloc.dart';

class LoginBlocEvent {}

class ForgotButtonPressed extends LoginBlocEvent {}

class LoginScreenButtonPressed extends LoginBlocEvent {
  final TextEditingController email;
  final TextEditingController password;

  LoginScreenButtonPressed({required this.email, required this.password});
}

class LoginWithGoogleButtonPressed extends LoginBlocEvent {}

class RegistorNowButtonPressed extends LoginBlocEvent {}

class SendcodeButtonPressed extends LoginBlocEvent {}

class VerifyButtonPressed extends LoginBlocEvent {}
