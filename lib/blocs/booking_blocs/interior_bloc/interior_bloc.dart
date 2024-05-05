import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'interior_event.dart';
part 'interior_state.dart';

class InteriorBloc extends Bloc<InteriorEvent, InteriorState> {
  InteriorBloc()
      : super(InteriorInitial(phonenumber: '', prices: [], servicekeys: [])) {
    on<InteriorServiceButtonPressed>(interiorservicebuttonpressed);
  }
  interiorservicebuttonpressed(
      InteriorServiceButtonPressed event, Emitter<InteriorState> emit) async {
    emit(InteriorServiceeButtonNavigation(
        phonenumber: event.shopphone,
        prices: state.prices,
        servicekeys: state.servicekeys));
    emit(InteriorServiceloading(
        phonenumber: event.shopphone,
        prices: state.prices,
        servicekeys: state.servicekeys));
    try {
      final servicemap = await ShopRepository()
          .getShopDetailswithmap(event.shopphone, event.servicemapkey);
      List<String> services = [];
      List<dynamic> rates = [];
      Map<String, dynamic> map = servicemap.first[event.servicemapkey];
      map.forEach((key, value) {
        services.add(key);
        rates.add(value);
      });
      emit(InteriorServiceLoaded(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
      emit(InteriorInitial(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
    } catch (e) {
      print('something went wrong in bloc $e');
    }
  }
}
