part of 'offday_bloc.dart';

sealed class OffdayEvent {}

class FetchDays extends OffdayEvent {
  final String phone;

  FetchDays({required this.phone});
}
