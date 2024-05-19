import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
part 'total_bill_event.dart';
part 'total_bill_state.dart';

class TotalBillBloc extends Bloc<TotalBillEvent, TotalBillState> {
  TotalBillBloc()
      : super(TotalBillInitial(
            bookingId: '',
            extraFitting: '',
            extraService: '',
            serviceName: '',
            totalAmount: '',
            vehicleNumber: '')) {
    on<FetchTotalBill>(fetchTotalBill);
    on<AddMoneyToWallet>(addmoneyTowallet);
    on<MoneyAddeddSuccess>(moneyaddedSucces);
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
              totalAmount: shopBookingDetails[ReferenceKeys.totalAmount],
              bookingId: shopBookingDetails[ReferenceKeys.bookingId]));
          log('all fetched');
        } else {
          log('value not founded');
        }
      }
    } catch (e) {
      log('there is a error in total fetching bloc$e');
    }
  }

  addmoneyTowallet(AddMoneyToWallet event, Emitter<TotalBillState> emit) async {
    try {
      log('started');
      final reference = ShopReference()
          .shopCollectionReference()
          .doc(event.shopId)
          .collection(ReferenceKeys.wallet)
          .doc();
      reference.set({"money": event.amount});
      log('successfully money added to wallet');
    } catch (e) {
      log('there is a error in money adding to wallet $e');
    }
  }

  moneyaddedSucces(
      MoneyAddeddSuccess event, Emitter<TotalBillState> emit) async {
    try {
      final userid = await UserDocId().getUserId();
      final currentIdInShop = await ShopReference()
          .shopCollectionReference()
          .doc(event.shopId)
          .collection(Shopkeys.newBooking)
          .where(ReferenceKeys.vehiclenumber, isEqualTo: state.vehicleNumber)
          .where(ReferenceKeys.servicename, isEqualTo: state.serviceName)
          .get();
      final bookingIdInShop = currentIdInShop.docs.first.id;
      final userDocRef = UserDataReference()
          .userCollectionReference()
          .doc(userid)
          .collection(ReferenceKeys.bookings)
          .doc(bookingIdInShop);
      userDocRef.update({ReferenceKeys.ordered: false});
    } catch (e) {
      log('there is a error in money addedsuccess $e');
    }
  }
}
