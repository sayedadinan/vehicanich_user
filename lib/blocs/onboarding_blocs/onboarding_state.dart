part of 'onboarding_bloc.dart';

sealed class OnboardingBlocState {}

class Initialblocstate extends OnboardingBlocState {}

class NavigatetosecondOnboardingPage extends OnboardingBlocState {}

class NavigatetoLoginorSignPage extends OnboardingBlocState {}

class Navigatetosignpage extends OnboardingBlocState {}

class NavigatetoLoginPage extends OnboardingBlocState {}
