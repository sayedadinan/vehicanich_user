import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
    try {
      if (event.formkey.currentState!.validate()) {
        emit(LoginLoading());

        User? user = await auth.sighInWIthEmailAndPassword(
            event.email.text, event.password.text);
        log('this user $user');
        if (user != null) {
          log('user login successful');
          UserRepository().saveUserEmailToSharedPreferences(event.email.text);
          emit(NavigateToHome());
        } else {
          final snackBar = SnackBar(
            padding: const EdgeInsets.all(26),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oops!',
              message: 'something went wrong',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(event.context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          emit(LoginErrorHappened(error: 'some thing went wrong'));
          log('something went wrong');
        }
      }
    } catch (e) {
      final snackBar = SnackBar(
        padding: const EdgeInsets.all(26),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oops!',
          message: 'something went wrong',
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(event.context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      emit(LoginErrorHappened(error: 'some thing went wrong'));
      log('something went wrong');
      emit(LoginErrorHappened(error: e.toString()));
    }
  }

  loginwithgooglebuttonpressed(
      LoginWithGoogleButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(LoginLoading());
  }
}
