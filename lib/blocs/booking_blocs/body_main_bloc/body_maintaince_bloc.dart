import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'body_maintaince_event.dart';
part 'body_maintaince_state.dart';

class BodyMaintainceBloc
    extends Bloc<BodyMaintainceEvent, BodyMaintainceState> {
  BodyMaintainceBloc()
      : super(BodyMaintainceInitial(
          prices: [],
          servicekeys: [],
          phonenumber: '',
        )) {
    on<BodyMaintainceButtonPressed>(bodymaintaincebuttonpressed);
    on<InteriorButtonPressed>(interiorbuttonpressed);
    on<EngineServiceButtonPressed>(engineservicebuttonpressed);
  }
  bodymaintaincebuttonpressed(BodyMaintainceButtonPressed event,
      Emitter<BodyMaintainceState> emit) async {
    emit(BodyMaintaincebuttonNavigation(
        phonenumber: event.shopphone,
        prices: state.prices,
        servicekeys: state.servicekeys));
    emit(Bodymaintainceloading(
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
      emit(BodyMaintainceLoaded(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
      emit(BodyMaintainceInitial(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
    } catch (e) {
      print('something went wrong in bloc body $e');
    }
  }

  interiorbuttonpressed(
      InteriorButtonPressed event, Emitter<BodyMaintainceState> emit) async {
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
      emit(BodyMaintainceInitial(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
    } catch (e) {
      print('something went wrong in bloc interior $e');
    }
  }

  engineservicebuttonpressed(EngineServiceButtonPressed event,
      Emitter<BodyMaintainceState> emit) async {
    emit(EngineServiceeButtonNavigation(
        phonenumber: event.shopphone,
        prices: state.prices,
        servicekeys: state.servicekeys));
    emit(EngineServiceloading(
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
      print(services);
      print(rates);
      emit(EngineServiceLoaded(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
      emit(BodyMaintainceInitial(
          prices: rates,
          servicekeys: services,
          phonenumber: state.phonenumber));
    } catch (e) {
      print('something went wrong in bloc in engine $e');
    }
  }
}
