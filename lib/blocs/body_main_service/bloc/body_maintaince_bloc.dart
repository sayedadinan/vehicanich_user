import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/body_maintain/body_maintain_repo.dart';
part 'body_maintaince_event.dart';
part 'body_maintaince_state.dart';

class BodyMaintainceBloc
    extends Bloc<BodyMaintainceEvent, BodyMaintainceState> {
  BodyMaintainceBloc()
      : super(BodyMaintainceInitial(prices: [], servicekeys: [])) {
    on<BodyMaintainceButtonPressed>(bodymaintaincebuttonpressed);
  }
  bodymaintaincebuttonpressed(BodyMaintainceButtonPressed event,
      Emitter<BodyMaintainceState> emit) async {
    try {
      final servicemap = await ShopRepository()
          .getShopDetails(event.shopphone, event.servicemapkey);
      List<String> services = [];
      List<dynamic> rates = [];
      Map<String, dynamic> map = servicemap.first[event.servicemapkey];
      map.forEach((key, value) {
        services.add(key);
        rates.add(value);
      });
      print('this is that services in bloc$services');
      print('this is that services in bloc$rates');
      emit(BodyMaintainceInitial(prices: rates, servicekeys: services));
      print('success');
      // Now you can emit the state or perform other operations with the data.
    } catch (e) {
      print('something went wrong in bloc $e');
    }
  }
}
