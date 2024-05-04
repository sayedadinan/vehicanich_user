part of 'body_maintaince_bloc.dart';

sealed class BodyMaintainceState {
  List<String> servicekeys = [];
  List<dynamic> prices = [];
  final String phonenumber;
  BodyMaintainceState({
    required this.prices,
    required this.servicekeys,
    required this.phonenumber,
  });
}

final class BodyMaintainceInitial extends BodyMaintainceState {
  BodyMaintainceInitial(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class BodyMaintaincebuttonNavigation extends BodyMaintainceState {
  BodyMaintaincebuttonNavigation(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class BodyMaintainceLoaded extends BodyMaintainceState {
  BodyMaintainceLoaded(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class Bodymaintainceloading extends BodyMaintainceState {
  Bodymaintainceloading(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}
