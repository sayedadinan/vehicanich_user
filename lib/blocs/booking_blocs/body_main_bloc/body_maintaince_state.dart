part of 'body_maintaince_bloc.dart';

sealed class BodyMaintainceState {
  List<dynamic> services;
  final String phonenumber;

  BodyMaintainceState({required this.phonenumber, required this.services});
}

final class BodyMaintainceInitial extends BodyMaintainceState {
  BodyMaintainceInitial({required super.phonenumber, required super.services});
}

class BodyMaintaincebuttonNavigation extends BodyMaintainceState {
  BodyMaintaincebuttonNavigation(
      {required super.phonenumber, required super.services});
}

class BodyMaintainceLoaded extends BodyMaintainceState {
  BodyMaintainceLoaded({required super.phonenumber, required super.services});
}

class Bodymaintainceloading extends BodyMaintainceState {
  Bodymaintainceloading({required super.phonenumber, required super.services});
}

class InteriorServiceeButtonNavigation extends BodyMaintainceState {
  InteriorServiceeButtonNavigation(
      {required super.phonenumber, required super.services});
}

class InteriorServiceLoaded extends BodyMaintainceState {
  InteriorServiceLoaded({required super.phonenumber, required super.services});
}

class InteriorServiceloading extends BodyMaintainceState {
  InteriorServiceloading({required super.phonenumber, required super.services});
}

class EngineServiceeButtonNavigation extends BodyMaintainceState {
  EngineServiceeButtonNavigation(
      {required super.phonenumber, required super.services});
}

class EngineServiceLoaded extends BodyMaintainceState {
  EngineServiceLoaded({required super.phonenumber, required super.services});
}

class EngineServiceloading extends BodyMaintainceState {
  EngineServiceloading({required super.phonenumber, required super.services});
}
