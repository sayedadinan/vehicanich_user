sealed class ForgotButtonState {}

class InitialForgotstage extends ForgotButtonState {}

class EmailVerified extends ForgotButtonState {}

class EmailLoadingState extends ForgotButtonState {}

class Emailtakingerror extends ForgotButtonState {
  final String error;

  Emailtakingerror({required this.error});
}
