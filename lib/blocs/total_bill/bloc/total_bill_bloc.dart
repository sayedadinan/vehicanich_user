import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
part 'total_bill_event.dart';
part 'total_bill_state.dart';

class TotalBillBloc extends Bloc<TotalBillEvent, TotalBillState> {
  TotalBillBloc()
      : super(TotalBillInitial(
            extraFitting: '',
            extraService: '',
            serviceName: '',
            totalAmount: '',
            vehicleNumber: '')) {
    on<FetchTotalBill>(fetchTotalBill);
  }
  fetchTotalBill(FetchTotalBill event, Emitter<TotalBillState> emit) async {
    log('worded');
    try {
      final currentIdInShop = await ShopReference()
          .shopCollectionReference()
          .doc(event.shopId)
          .collection(Shopkeys.totalBill)
          .where(ReferenceKeys.vehicleNumber, isEqualTo: event.vehicleNumber)
          .where(ReferenceKeys.serviceName, isEqualTo: event.serviceName)
          .get();
      log(event.shopId);
      if (currentIdInShop.docs.isNotEmpty) {
        final bookingIdInShop = currentIdInShop.docs.first.id;
        final shopBookingDetails = await ShopReference()
            .shopCollectionReference()
            .doc(event.shopId)
            .collection(Shopkeys.totalBill)
            .doc(bookingIdInShop)
            .get();
        if (shopBookingDetails.exists) {
          log(shopBookingDetails[ReferenceKeys.serviceName]);
          emit(TotalBillInitial(
              serviceName: shopBookingDetails[ReferenceKeys.serviceName],
              vehicleNumber: shopBookingDetails[ReferenceKeys.vehicleNumber],
              extraFitting: shopBookingDetails[ReferenceKeys.extraFitting],
              extraService: shopBookingDetails[ReferenceKeys.extraServices],
              totalAmount: shopBookingDetails[ReferenceKeys.totalAmount]));
          log('all fetched');
        } else {
          log('value not founded');
        }
      }
    } catch (e) {
      log('there is a error in total fetching bloc$e');
    }
  }
}
