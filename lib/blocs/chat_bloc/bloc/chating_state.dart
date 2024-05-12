part of 'chating_bloc.dart';

sealed class ChatingState {
  final String shopId;

  ChatingState({required this.shopId});
}

final class ChatingInitial extends ChatingState {
  ChatingInitial({required super.shopId});
}
