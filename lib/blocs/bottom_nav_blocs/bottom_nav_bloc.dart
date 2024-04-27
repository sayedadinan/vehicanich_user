import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBloc() : super(NavBarInitial(page: 0)) {
    on<BottomnavbarPressed>(navBarInitial);
  }

  navBarInitial(
      BottomnavbarPressed event, Emitter<BottomNavigationBarState> emit) {
    emit(NavBarInitial(page: event.page));
  }
}
