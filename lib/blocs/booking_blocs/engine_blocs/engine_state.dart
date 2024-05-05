part of 'engine_bloc.dart';

sealed class EngineState {
  List<String> servicekeys = [];
  List<dynamic> prices = [];
  final String phonenumber;

  EngineState({
    required this.phonenumber,
    required this.servicekeys,
    required this.prices,
  });
}

final class EngineInitial extends EngineState {
  EngineInitial(
      {required super.phonenumber,
      required super.servicekeys,
      required super.prices});
}

class EngineServiceeButtonNavigation extends EngineState {
  EngineServiceeButtonNavigation(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class EngineServiceLoaded extends EngineState {
  EngineServiceLoaded(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}

class EngineServiceloading extends EngineState {
  EngineServiceloading(
      {required super.prices,
      required super.servicekeys,
      required super.phonenumber});
}
