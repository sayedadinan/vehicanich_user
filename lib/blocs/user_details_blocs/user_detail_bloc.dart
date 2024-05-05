import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(InitialUserDetailsState()) {
    on<UserDataLoaded>(userdataloaded);
    on<UserDetailsEditingButtonClicked>(userdetaileditingPage);
  }
  userdataloaded(UserDataLoaded event, Emitter<UserDetailsState> emit) async {
    emit(UserDetailsLoading());
    try {
      final user = await UserRepository().getuserDetails(event.email);
      emit(UserDetailsLoaded(user: user));
    } catch (e) {
      // emit(UserDetailserror(error: 'Failed to load user details'));
    }
  }

  userdetaileditingPage(
      UserDetailsEditingButtonClicked event, Emitter<UserDetailsState> emit) {
    emit(NavigateToEditingPage());
  }
}
