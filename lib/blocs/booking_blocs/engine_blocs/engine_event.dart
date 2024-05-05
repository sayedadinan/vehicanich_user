part of 'engine_bloc.dart';

sealed class EngineEvent {}

class EngineServiceButtonPressed extends EngineEvent {
  final String shopphone;
  final String servicemapkey;
  EngineServiceButtonPressed(
      {required this.shopphone, required this.servicemapkey});
}
