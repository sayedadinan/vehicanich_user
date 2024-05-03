part of 'body_maintaince_bloc.dart';

sealed class BodyMaintainceState {}

final class BodyMaintainceInitial extends BodyMaintainceState {
  List<String> servicekeys = [];
  List<dynamic> prices = [];
  BodyMaintainceInitial({required this.prices, required this.servicekeys});
}

class BodyMaintaincebuttonNavigation extends BodyMaintainceState {}
