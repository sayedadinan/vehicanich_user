part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class BookingbuttonPressed extends BookingEvent {
  final String vehiclenumbercontroller;
  final String userphonenumbercontroller;
  final DateTime datepicked;
  final String shopphonenumber;
  final String servicename;
  final GlobalKey bookingKey;
  final BuildContext context;
  BookingbuttonPressed({
    required this.context,
    required this.servicename,
    required this.vehiclenumbercontroller,
    required this.datepicked,
    required this.userphonenumbercontroller,
    required this.shopphonenumber,
    required this.bookingKey,
  });
}

class BookingCancelledPressed extends BookingEvent {
  final String shopId;
  final String serviceName;
  final String vehicleNumber;
  BookingCancelledPressed({
    required this.serviceName,
    required this.shopId,
    required this.vehicleNumber,
  });
}

class CurrentStatus extends BookingEvent {
  final String shopId;
  final String serviceName;
  final String vehicleNumber;

  CurrentStatus(
      {required this.shopId,
      required this.serviceName,
      required this.vehicleNumber});
}
