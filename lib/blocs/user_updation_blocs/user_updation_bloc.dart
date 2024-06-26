import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
part 'user_updation_event.dart';
part 'user_updation_state.dart';

class UserDetailsUpdationBloc
    extends Bloc<UserDetailsUpdationEvent, UserDetailsUpdationState> {
  UserDetailsUpdationBloc() : super(InitialUserDetailsEditing()) {
    on<UserDataFetched>(userdataloaded);
    on<UserDetailsUpdateButton>(userdetailsupdatebutton);
  }
  userdataloaded(
      UserDataFetched event, Emitter<UserDetailsUpdationState> emit) async {
    emit(UserDetailsLoading());
    try {
      final user = await UserRepository().getuserDetails();
      emit(UserDetailsLoaded(user: user));
    } catch (e) {
      // emit(UserDetailserror(error: 'Failed to load user details'));
    }
  }

  userdetailsupdatebutton(UserDetailsUpdateButton event,
      Emitter<UserDetailsUpdationState> emit) async {
    try {
      await UserRepository().updateuser(event.user);
      emit(UserDetailsUpdationButton());
    } catch (e) {
      print('error is here in userdetailsupdation bloc $e');
    }
  }
}
