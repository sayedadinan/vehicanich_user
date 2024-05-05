part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class BookingbuttonPressed extends BookingEvent {
  final String vehiclenumbercontroller;
  final String userphonenumbercontroller;
  final DateTime datepicked;
  final String shopphonenumber;
  final String servicename;
  BookingbuttonPressed({
    required this.servicename,
    required this.vehiclenumbercontroller,
    required this.datepicked,
    required this.userphonenumbercontroller,
    required this.shopphonenumber,
  });
}
