import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'chating_event.dart';
part 'chating_state.dart';

class ChatingBloc extends Bloc<ChatingEvent, ChatingState> {
  ChatingBloc() : super(ChatingInitial(shopId: '')) {
    on<FetchShopId>(fetchShopId);
  }
  fetchShopId(FetchShopId event, Emitter<ChatingState> emit) async {
    final shopId =
        await ShopRepository().shopidgettingwithphone(event.shopPhone);
    print('this is shopId from bloc$shopId');
    emit(ChatingInitial(shopId: shopId));
  }
}
