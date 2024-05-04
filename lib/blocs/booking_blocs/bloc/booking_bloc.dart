// ignore_for_file: avoid_print, unused_local_variable
import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  }
  bookingbuttonpressed(
      BookingbuttonPressed event, Emitter<BookingState> emit) async {
    final userid = await UserDocId().getUserId();
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
      "phone": event.userphonenumbercontroller,
      "vehiclenumber": event.vehiclenumbercontroller,
      "date": formattedDate
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
        "vehiclenumber": event.vehiclenumbercontroller
      });
      // DocumentSnapshot<Object?> datas = await userDocRef.get();
      // Map<String, dynamic>? data = datas.data() as Map<String, dynamic>?;
      // List<dynamic> dataList = data?[ReferenceKeys.bookingdetails] ?? [];
      // List<dynamic> newlist = [...dataList, ...forchanging];
      // userDocRef.update({ReferenceKeys.bookingdetails: newlist});
      // print(newlist);
    } catch (e) {
      // Handle errors
    }
  }
}
