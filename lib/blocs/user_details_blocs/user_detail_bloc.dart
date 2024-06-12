import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc()
      : super(InitialUserDetailsState(
            email: '', userName: '', profileImagePath: '')) {
    on<UserDetailsFetching>(userdetailsFetching);
    on<UserDetailsEditingButtonClicked>(userdetaileditingPage);
  }
  userdetailsFetching(
    UserDetailsFetching event,
    Emitter<UserDetailsState> emit,
  ) async {
    emit(UserDetailsLoading(
        email: state.email,
        userName: state.userName,
        profileImagePath: state.profileImagePath));
    try {
      if (event.isGoogleSignIn) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        emit(InitialUserDetailsState(
            userName: googleUser!.displayName,
            email: googleUser.email,
            profileImagePath: googleUser.photoUrl));
      }
      final user = await UserRepository().getuserDetails();
      emit(InitialUserDetailsState(
        profileImagePath: user.profileImagePath,
        userName: user.userName,
        email: user.email,
      ));
    } catch (e) {
      log('there is a error in user details fetching aree $e');
    }
  }

  userdetaileditingPage(
      UserDetailsEditingButtonClicked event, Emitter<UserDetailsState> emit) {
    emit(InitialUserDetailsState(
        userName: state.userName,
        email: state.email,
        profileImagePath: state.profileImagePath));
  }
}
