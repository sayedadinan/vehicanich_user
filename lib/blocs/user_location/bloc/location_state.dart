part of 'location_bloc.dart';

@immutable
class LocationState {
  final String currentLocation;
  final Position? currentPosition;

  LocationState({required this.currentLocation, required this.currentPosition});
}

final class LocationInitial extends LocationState {
  LocationInitial(
      {required super.currentLocation, required super.currentPosition});
}

final class LocationServiceNotEnabled extends LocationState {
  LocationServiceNotEnabled(
      {required super.currentLocation, required super.currentPosition});
}

final class FetchingUserLocation extends LocationState {
  FetchingUserLocation(
      {required super.currentLocation, required super.currentPosition});
}
