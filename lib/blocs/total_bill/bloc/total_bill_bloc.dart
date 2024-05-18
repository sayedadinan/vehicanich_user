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
          .where(ReferenceKeys.vehiclenumber, isEqualTo: event.vehicleNumber)
          .where(ReferenceKeys.servicename, isEqualTo: event.serviceName)
          .get();
      log(event.shopId);
      if (currentIdInShop.docs.isNotEmpty) {
        final bookingIdInShop = currentIdInShop.docs.first.id;
        log('bloc 3 $bookingIdInShop');
        final shopBookingDetails = await ShopReference()
            .shopCollectionReference()
            .doc(event.shopId)
            .collection(Shopkeys.totalBill)
            .doc(bookingIdInShop)
            .get();
        if (shopBookingDetails.exists) {
          emit(TotalBillInitial(
              serviceName: shopBookingDetails[ReferenceKeys.serviceName],
              vehicleNumber: shopBookingDetails[ReferenceKeys.vehiclenumber],
              extraFitting: shopBookingDetails[ReferenceKeys.extraFitting],
              extraService: shopBookingDetails[ReferenceKeys.extraServices],
              totalAmount: shopBookingDetails[ReferenceKeys.totalAmount]));
        } else {
          log('value not founded');
        }
      }
    } catch (e) {
      log('there is a error in total fetching bloc$e');
    }
  }
}
