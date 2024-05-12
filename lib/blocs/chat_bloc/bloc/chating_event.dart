part of 'chating_bloc.dart';

sealed class ChatingEvent {}

class FetchShopId extends ChatingEvent {
  final String shopPhone;

  FetchShopId({required this.shopPhone});
}
