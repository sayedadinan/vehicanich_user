part of 'body_maintaince_bloc.dart';

sealed class BodyMaintainceEvent {}

class BodyMaintainceButtonPressed extends BodyMaintainceEvent {
  final String shopphone;
  final String servicemapkey;
  BodyMaintainceButtonPressed(
      {required this.shopphone, required this.servicemapkey});
}

class InteriorButtonPressed extends BodyMaintainceEvent {
  final String shopphone;
  final String servicemapkey;

  InteriorButtonPressed({required this.shopphone, required this.servicemapkey});
}

class EngineServiceButtonPressed extends BodyMaintainceEvent {
  final String shopphone;
  final String servicemapkey;

  EngineServiceButtonPressed(
      {required this.shopphone, required this.servicemapkey});
}
