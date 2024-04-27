import 'package:bloc/bloc.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingblocEvent, OnboardingBlocState> {
  OnboardingBloc() : super(Initialblocstate()) {
    on<NextButtonPressed>(nextButtonPressed);
    on<LoginButtonPressed>(loginButtonPressed);
    on<Signinbuttonpressed>(signinButtonPressed);
  }
  nextButtonPressed(
      NextButtonPressed event, Emitter<OnboardingBlocState> emit) {
    if (event.page == 0) {
      emit(NavigatetosecondOnboardingPage());
    } else if (event.page == 1) {
      emit(NavigatetoLoginorSignPage());
    }
  }

  loginButtonPressed(
      LoginButtonPressed event, Emitter<OnboardingBlocState> emit) {
    emit(NavigatetoLoginPage());
  }

  signinButtonPressed(
      Signinbuttonpressed event, Emitter<OnboardingBlocState> emit) {
    emit(Navigatetosignpage());
  }
}
