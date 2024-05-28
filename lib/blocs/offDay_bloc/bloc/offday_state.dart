part of 'offday_bloc.dart';

sealed class OffdayState {
  List<DateTime> datetime;

  OffdayState({required this.datetime});
}

final class OffdayInitial extends OffdayState {
  OffdayInitial({required super.datetime});
}
