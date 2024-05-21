import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(InitialUserDetailsState(email: '', userName: '')) {
    on<UserDetailsFetching>(userdetailsFetching);
    on<UserDetailsEditingButtonClicked>(userdetaileditingPage);
  }
  userdetailsFetching(
      UserDetailsFetching event, Emitter<UserDetailsState> emit) async {
    emit(UserDetailsLoading(email: state.email, userName: state.userName));
    try {
      final user = await UserRepository().getuserDetails();
      emit(InitialUserDetailsState(
        userName: user.userName,
        email: user.email,
      ));
    } catch (e) {
      log('there is a error in user details fetching area $e');
    }
  }

  userdetaileditingPage(
      UserDetailsEditingButtonClicked event, Emitter<UserDetailsState> emit) {
    emit(InitialUserDetailsState(userName: state.userName, email: state.email));
  }
}
