import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:intl/intl.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc()
      : super(BookingInitial(
            isCompleted: false, isPending: false, isStarted: false)) {
    on<BookingbuttonPressed>(bookingbuttonpressed);
    on<BookingCancelledPressed>(bookingCancelledPressed);
    on<CurrentStatus>(currentStatus);
  }
  bookingbuttonpressed(
      BookingbuttonPressed event, Emitter<BookingState> emit) async {
    final userid = await UserDocId().getUserId();
    final userEmail = await UserDocId().getUserEmail();
    List<dynamic> carrying = [];
    List<dynamic> forchanging = [];
    DateTime dateTime = DateTime.parse(event.datepicked.toString());
    String formattedDate = DateFormat('dd MM yyyy').format(dateTime);
    carrying.add(event.userphonenumbercontroller);
    carrying.add(formattedDate);
    carrying.add(event.vehiclenumbercontroller);
    forchanging.addAll(carrying);
    final shopid =
        await ShopRepository().shopidgettingwithphone(event.shopphonenumber);
    final reference = ShopReference()
        .shopCollectionReference()
        .doc(shopid)
        .collection("newbooking");
    reference.add({
      "userphone": event.userphonenumbercontroller,
      "vehiclenumber": event.vehiclenumbercontroller,
      "date": formattedDate,
      "servicename": event.servicename,
      "isPending": true,
      "isStarted": false,
      "isCompleted": false,
      "userId": userid,
      "userEmail": userEmail,
      "ordered": true,
    });
    emit(BookingSuccess(
        isStarted: state.isStarted,
        isPending: state.isPending,
        isCompleted: state.isCompleted));
    final userDocRef = UserDataReference()
        .userCollectionReference()
        .doc(userid)
        .collection(ReferenceKeys.bookings)
        .doc();
    try {
      userDocRef.set({
        "shopphone": event.shopphonenumber,
        "date": formattedDate,
        "vehiclenumber": event.vehiclenumbercontroller,
        "servicename": event.servicename,
        "ordered": true,
        "shopId": shopid,
      });
      emit(BookingSuccess(
          isStarted: state.isStarted,
          isPending: state.isPending,
          isCompleted: state.isCompleted));
      Navigator.of(event.context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomBar()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      emit(BookingError(
          isStarted: state.isStarted,
          isPending: state.isPending,
          isCompleted: state.isCompleted));
      // Handle errors
    }
  }

  bookingCancelledPressed(
      BookingCancelledPressed event, Emitter<BookingState> emit) async {
    // final userEmail = await getUserEmail();
    final userId = await getUserId();
    final bookingIdInShop = await getBookingIdInShop(
        event.shopId, event.vehicleNumber, event.serviceName);
    updateBookingInShop(event.shopId, bookingIdInShop);
    final bookingIdInUser = await getBookingIdInUser(userId, event.serviceName);
    updateBookingInUser(userId, bookingIdInUser);
  }

  currentStatus(CurrentStatus event, Emitter<BookingState> emit) async {
    try {
      final currentIdInShop = await ShopReference()
          .shopCollectionReference()
          .doc(event.shopId)
          .collection(Shopkeys.newBooking)
          .where(ReferenceKeys.vehiclenumber, isEqualTo: event.vehicleNumber)
          .where(ReferenceKeys.servicename, isEqualTo: event.serviceName)
          .get();
      log('from bloc 1 $currentIdInShop');
      if (currentIdInShop.docs.isNotEmpty) {
        final bookingIdInShop = currentIdInShop.docs.first.id;
        log('bloc 3 $bookingIdInShop');
        final shopBookingDetails = await ShopReference()
            .shopCollectionReference()
            .doc(event.shopId)
            .collection(Shopkeys.newBooking)
            .doc(bookingIdInShop)
            .get();
        if (shopBookingDetails.exists) {
          final isPending = shopBookingDetails[Shopkeys.isPending];
          final isCompleted = shopBookingDetails[Shopkeys.isCompleted];
          final isStarted = shopBookingDetails[Shopkeys.isStarted];
          log('this worked pending $isPending');
          log('this worked completed $isCompleted');
          log('this worked started $isStarted');
          if (isCompleted == true) {
            emit(BookingInitial(
                isStarted: true, isPending: true, isCompleted: true));
          } else if (isStarted == true) {
            emit(BookingInitial(
                isStarted: true, isPending: true, isCompleted: false));
          } else if (isPending == true) {
            emit(BookingInitial(
                isStarted: false, isPending: true, isCompleted: false));
          } else {
            log('there is some error in bloc');
          }
        }
        log(state.isStarted.toString());
        log(state.isPending.toString());
        log(state.isCompleted.toString());
      } else {
        log('No matching documents found.');
      }
    } catch (e) {
      log('there is some error in current status bloc $e');
    }
  }
}
