part of 'sign_up_bloc.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpError extends SignUpState {
  final String text;

  SignUpError({required this.text});
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpEmailNotVerified extends SignUpState {}
