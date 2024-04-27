part of 'onboarding_bloc.dart';

sealed class OnboardingblocEvent {}

class LoginButtonPressed extends OnboardingblocEvent {}

class NextButtonPressed extends OnboardingblocEvent {
  final double page;

  NextButtonPressed(this.page);
}

class Signinbuttonpressed extends OnboardingblocEvent {}
