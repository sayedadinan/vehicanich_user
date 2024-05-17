part of 'booking_bloc.dart';

sealed class BookingState {
  bool isStarted;
  bool isPending;
  bool isCompleted;
  BookingState(
      {required this.isStarted,
      required this.isPending,
      required this.isCompleted});
}

final class BookingInitial extends BookingState {
  BookingInitial(
      {required super.isStarted,
      required super.isPending,
      required super.isCompleted});
}
