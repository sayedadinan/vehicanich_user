import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/models/user_model.dart';
import 'package:vehicanich/repositories/user_repositery.dart';
import 'package:vehicanich/services/firebase_auth_implementation/firebase_auth_service.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBLoc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBLoc() : super(SignUpInitial()) {
    on<SignUpButtonPressed>(signInButtonPressed);
  }
  final currentUser = FirebaseAuth.instance.currentUser;
  signInButtonPressed(
      SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final userCredential =
          await FirebaseAuthService().sighUpWIthEmailAndPassword(
        event.user.email,
        event.user.password,
      );
      // await sendEmailVerification();
      final user = UserModel(
          userName: event.user.userName,
          password: event.user.password,
          email: event.user.email);
      await UserRepositery().saveUserData(user, userCredential!.uid);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(text: 'there is some error $e'));
    }
  }
}
