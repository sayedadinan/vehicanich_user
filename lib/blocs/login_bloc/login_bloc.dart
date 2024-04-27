import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/services/firebase_auth_implementation/firebase_auth_service.dart';
part 'login_event.dart';
part 'login_state.dart';

final FirebaseAuthService auth = FirebaseAuthService();

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(InitialBlocState()) {
    on<ForgotButtonPressed>(forgotButtonPressed);
    on<SendcodeButtonPressed>(sendcodeButtonPressed);
    on<VerifyButtonPressed>(verifyButtonPressed);
    on<LoginScreenButtonPressed>(loginScreenButtonPressed);
  }
  forgotButtonPressed(ForgotButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToForgetPage());
  }

  sendcodeButtonPressed(
      SendcodeButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToOtpPage());
  }

  verifyButtonPressed(VerifyButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToNewpassword());
  }

  loginScreenButtonPressed(
      LoginScreenButtonPressed event, Emitter<LoginBlocState> emit) async {
    try {
      User? user = await auth.sighInWIthEmailAndPassword(
          event.email.text, event.password.text);
      if (user != null) {
        print('user login successful');
        emit(NavigateToHome());
      } else {
        print('something went wrong');
      }
    } catch (e) {
      emit(LoginErrorHappened(error: e.toString()));
    }
  }
}
