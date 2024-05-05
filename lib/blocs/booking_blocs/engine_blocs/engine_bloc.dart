// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'engine_event.dart';
// part 'engine_state.dart';

// class EngineBloc extends Bloc<EngineEvent, EngineState> {
//   EngineBloc()
//       : super(EngineInitial(phonenumber: '', prices: [], servicekeys: [])) {
//     on<EngineServiceButtonPressed>(engineservicebuttonpressed);
//   }
//   engineservicebuttonpressed(
//       EngineServiceButtonPressed event, Emitter<EngineState> emit) async {
//     emit(EngineServiceeButtonNavigation(
//         phonenumber: event.shopphone,
//         prices: state.prices,
//         servicekeys: state.servicekeys));
//     emit(InteriorServiceloading(
//         phonenumber: event.shopphone,
//         prices: state.prices,
//         servicekeys: state.servicekeys));
//     try {
//       final servicemap = await ShopRepository()
//           .getShopDetailswithmap(event.shopphone, event.servicemapkey);
//       List<String> services = [];
//       List<dynamic> rates = [];
//       Map<String, dynamic> map = servicemap.first[event.servicemapkey];
//       map.forEach((key, value) {
//         services.add(key);
//         rates.add(value);
//       });
//       emit(InteriorServiceLoaded(
//           prices: rates,
//           servicekeys: services,
//           phonenumber: state.phonenumber));
//       emit(InteriorInitial(
//           prices: rates,
//           servicekeys: services,
//           phonenumber: state.phonenumber));
//     } catch (e) {
//       print('something went wrong in bloc $e');
//     }
//   }
// }
