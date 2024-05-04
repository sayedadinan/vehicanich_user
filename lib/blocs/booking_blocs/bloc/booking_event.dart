part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class BookingbuttonPressed extends BookingEvent {
  final String vehiclenumbercontroller;
  final String userphonenumbercontroller;
  final DateTime datepicked;
  final String shopphonenumber;
  BookingbuttonPressed({
    required this.vehiclenumbercontroller,
    required this.datepicked,
    required this.userphonenumbercontroller,
    required this.shopphonenumber,
  });
}
