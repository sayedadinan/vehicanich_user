part of 'login_bloc.dart';

sealed class LoginBlocState {}

class InitialBlocState extends LoginBlocState {}

class NavigateToForgetPage extends LoginBlocState {}

class NavigateToHome extends LoginBlocState {}

class NavigateToGoogleLogin extends LoginBlocState {}

class NavigateToRegisterNow extends LoginBlocState {}

class NavigateToOtpPage extends LoginBlocState {}

class NavigateToNewpassword extends LoginBlocState {}

class LoginErrorHappened extends LoginBlocState {
  final String error;

  LoginErrorHappened({required this.error});
}
