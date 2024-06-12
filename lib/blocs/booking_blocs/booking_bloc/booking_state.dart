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

class BookingError extends BookingState {
  BookingError(
      {required super.isStarted,
      required super.isPending,
      required super.isCompleted});
}

class BookingSuccess extends BookingState {
  BookingSuccess(
      {required super.isStarted,
      required super.isPending,
      required super.isCompleted});
}

class BookingLoading extends BookingState {
  BookingLoading(
      {required super.isStarted,
      required super.isPending,
      required super.isCompleted});
}
