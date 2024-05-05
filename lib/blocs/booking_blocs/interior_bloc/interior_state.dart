part of 'interior_bloc.dart';

sealed class InteriorState {
  List<String> servicekeys = [];
  List<dynamic> prices = [];
  final String phonenumber;

  InteriorState(
      {required this.phonenumber,
      required this.servicekeys,
      required this.prices});
}

final class InteriorInitial extends InteriorState {
  InteriorInitial(
      {required super.phonenumber,
      required super.servicekeys,
      required super.prices});
}

class InteriorServiceeButtonNavigation extends InteriorState {
  InteriorServiceeButtonNavigation(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class InteriorServiceLoaded extends InteriorState {
  InteriorServiceLoaded(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class InteriorServiceloading extends InteriorState {
  InteriorServiceloading(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}
