part of 'body_maintaince_bloc.dart';

sealed class BodyMaintainceEvent {}

class BodyMaintainceButtonPressed extends BodyMaintainceEvent {
  final String shopphone;
  final String servicemapkey;
  BodyMaintainceButtonPressed(
      {required this.shopphone, required this.servicemapkey});
}
