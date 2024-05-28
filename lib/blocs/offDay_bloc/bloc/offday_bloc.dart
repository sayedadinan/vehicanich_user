import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'offday_event.dart';
part 'offday_state.dart';

class OffdayBloc extends Bloc<OffdayEvent, OffdayState> {
  OffdayBloc() : super(OffdayInitial(datetime: [])) {
    on<FetchDays>(fetchoffdays);
  }
  fetchoffdays(FetchDays event, Emitter<OffdayState> emit) async {
    try {
      log('worked this ');
      final carry = await ShopRepository().fetchOffDays(event.phone);
      emit(OffdayInitial(datetime: carry));
      log(state.datetime.toString());
    } catch (e) {
      log('there is a error');
    }
  }
}
