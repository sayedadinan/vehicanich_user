import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'body_maintaince_event.dart';
part 'body_maintaince_state.dart';

class BodyMaintainceBloc
    extends Bloc<BodyMaintainceEvent, BodyMaintainceState> {
  BodyMaintainceBloc()
      : super(BodyMaintainceInitial(
          services: [],
          phonenumber: '',
        )) {
    on<BodyMaintainceButtonPressed>(bodymaintaincebuttonpressed);
    on<InteriorButtonPressed>(interiorbuttonpressed);
    on<EngineServiceButtonPressed>(engineservicebuttonpressed);
  }
  bodymaintaincebuttonpressed(BodyMaintainceButtonPressed event,
      Emitter<BodyMaintainceState> emit) async {
    log('worked bod');
    emit(BodyMaintaincebuttonNavigation(
        phonenumber: event.shopphone, services: state.services));
    emit(Bodymaintainceloading(
        phonenumber: event.shopphone, services: state.services));
    try {
      final servicemap = await ShopRepository()
          .getShopDetailswithmap(event.shopphone, event.servicemapkey);
      List<dynamic> serviceList = servicemap.first[event.servicemapkey];
      emit(BodyMaintainceLoaded(
          phonenumber: state.phonenumber, services: serviceList));
      emit(BodyMaintainceInitial(
          services: serviceList, phonenumber: state.phonenumber));
    } catch (e) {
      print('something went wrong in bloc body $e');
    }
  }

  interiorbuttonpressed(
      InteriorButtonPressed event, Emitter<BodyMaintainceState> emit) async {
    log('worked intee');
    emit(InteriorServiceeButtonNavigation(
        phonenumber: event.shopphone, services: state.services));
    emit(InteriorServiceloading(
      services: state.services,
      phonenumber: event.shopphone,
    ));
    try {
      final servicemap = await ShopRepository()
          .getShopDetailswithmap(event.shopphone, event.servicemapkey);
      List<dynamic> serviceList = servicemap.first[event.servicemapkey];

      emit(InteriorServiceLoaded(
        services: state.services,
        phonenumber: state.phonenumber,
      ));
      emit(BodyMaintainceInitial(
          phonenumber: state.phonenumber, services: serviceList));
    } catch (e) {
      print('something went wrong in bloc interior $e');
    }
  }

  engineservicebuttonpressed(EngineServiceButtonPressed event,
      Emitter<BodyMaintainceState> emit) async {
    emit(EngineServiceeButtonNavigation(
      services: state.services,
      phonenumber: event.shopphone,
    ));
    emit(EngineServiceloading(
      services: state.services,
      phonenumber: event.shopphone,
    ));
    try {
      final servicemap = await ShopRepository()
          .getShopDetailswithmap(event.shopphone, event.servicemapkey);
      List<dynamic> serviceList = servicemap.first[event.servicemapkey];
      emit(EngineServiceLoaded(
          phonenumber: state.phonenumber, services: state.services));
      emit(BodyMaintainceInitial(
          phonenumber: state.phonenumber, services: serviceList));
    } catch (e) {
      print('something went wrong in bloc in engine $e');
    }
  }
}
