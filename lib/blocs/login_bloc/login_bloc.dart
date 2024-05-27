import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/data/services/firebase_auth_implementation/firebase_auth_service.dart';
part 'login_event.dart';
part 'login_state.dart';

final FirebaseAuthService auth = FirebaseAuthService();

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(InitialBlocState()) {
    on<ForgotButtonPressed>(forgotButtonPressed);
    on<SendcodeButtonPressed>(sendcodeButtonPressed);
    on<VerifyButtonPressed>(verifyButtonPressed);
    on<LoginScreenButtonPressed>(loginScreenButtonPressed);
    on<LoginWithGoogleButtonPressed>(loginwithgooglebuttonpressed);
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
    emit(LoginLoading());
    try {
      if (event.formkey.currentState!.validate()) {
        User? user = await auth.sighInWIthEmailAndPassword(
            event.email.text, event.password.text);
        log('this user $user');
        if (user != null) {
          log('user login successful');
          emit(NavigateToHome());
          UserRepository().saveUserEmailToSharedPreferences(event.email.text);
          // final snackBar = SnackBar(
          //   padding: const EdgeInsets.all(26),
          //   elevation: 0,
          //   behavior: SnackBarBehavior.floating,
          //   backgroundColor: Colors.transparent,
          //   content: AwesomeSnackbarContent(
          //     title: 'On logout',
          //     message: 'you logouted from your account',
          //     contentType: ContentType.warning,
          //   ),
          // );
          // ScaffoldMessenger.of(event.context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);
        } else {
          emit(LoginErrorHappened(error: 'some thing went wrong'));
          log('something went wrong');
        }
      }
    } catch (e) {
      emit(LoginErrorHappened(error: e.toString()));
    }
  }

  loginwithgooglebuttonpressed(
      LoginWithGoogleButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(LoginLoading());
  }
}
