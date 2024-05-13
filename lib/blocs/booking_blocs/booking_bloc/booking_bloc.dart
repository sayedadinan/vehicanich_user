// ignore_for_file: avoid_print, unused_local_variable
import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:intl/intl.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingbuttonPressed>(bookingbuttonpressed);
    on<BookingCancelledPressed>(bookingcancelledPressed);
  }
  bookingbuttonpressed(
      BookingbuttonPressed event, Emitter<BookingState> emit) async {
    final userid = await UserDocId().getUserId();
    final userEmail = await UserDocId().getUserEmail();
    List<dynamic> carrying = [];
    List<dynamic> forchanging = [];
    print(event.userphonenumbercontroller);
    print(event.vehiclenumbercontroller);
    DateTime dateTime = DateTime.parse(event.datepicked.toString());
    String formattedDate = DateFormat('dd MM yyyy').format(dateTime);
    print(formattedDate);
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
      "ordered": true
    });
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
        "shopId": shopid
      });
    } catch (e) {
      // Handle errors
    }
  }

  bookingcancelledPressed(
      BookingCancelledPressed event, Emitter<BookingState> emit) async {
    print('worked');
    print('this is shopId${event.shopId}');
    final userEmail = await UserDocId().getUserEmail();
    final userId = await UserDocId().getUserId();
    final currentIdInShop = await ShopReference()
        .shopCollectionReference()
        .doc(event.shopId)
        .collection("newbooking")
        .where(ReferenceKeys.vehiclenumber, isEqualTo: event.vehicleNumber)
        .where(ReferenceKeys.servicename, isEqualTo: event.serviceName)
        .get();
    final bookingIdInShop = currentIdInShop.docs.first.id;
    final reference = ShopReference()
        .shopCollectionReference()
        .doc(event.shopId)
        .collection("newbooking")
        .doc(bookingIdInShop);
    reference.update({ReferenceKeys.ordered: false});
    final currentIdUser = await UserDataReference()
        .userCollectionReference()
        .doc(userId)
        .collection(ReferenceKeys.bookings)
        .where(ReferenceKeys.servicename, isEqualTo: event.serviceName)
        .get();
    final bookingIdInUser = currentIdUser.docs.first.id;
    print('this is bookinguser $bookingIdInUser');
    final userDocRef = await UserDataReference()
        .userCollectionReference()
        .doc(userId)
        .collection(ReferenceKeys.bookings)
        .doc(bookingIdInUser);
    userDocRef.update({ReferenceKeys.ordered: false});
  }
}
