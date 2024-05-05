part of 'interior_bloc.dart';

sealed class InteriorEvent {}

class InteriorServiceButtonPressed extends InteriorEvent {
  final String shopphone;
  final String servicemapkey;
  InteriorServiceButtonPressed(
      {required this.shopphone, required this.servicemapkey});
}
