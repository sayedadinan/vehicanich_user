import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_event.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_state.dart';
import 'package:vehicanich/repositories/forgot_password.dart';

class ForgotBloc extends Bloc<ForgotButtonEvent, ForgotButtonState> {
  ForgotBloc() : super(InitialForgotstage()) {
    on<SendCodeButtonPressed>(sendcodeButtonPressed);
  }
  sendcodeButtonPressed(
      SendCodeButtonPressed event, Emitter<ForgotButtonState> emit) async {
    emit(EmailLoadingState());
    try {
      await ForgotPasswordEmailSend()
          .sendPasswordResetEmail(event.emailcontroller.text);
      emit(EmailVerified());
    } catch (e) {
      emit(Emailtakingerror(error: e.toString()));
      throw e;
    }
  }
}
