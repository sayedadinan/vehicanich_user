part of 'location_bloc.dart';

abstract class LocationState {
  final String currentLocation;
  final Position? currentPosition;

  LocationState({required this.currentLocation, required this.currentPosition});
}

class LocationInitial extends LocationState {
  LocationInitial(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationServiceNotEnabled extends LocationState {
  LocationServiceNotEnabled(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationPermissionDenied extends LocationState {
  LocationPermissionDenied(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationPermissionRequestFailed extends LocationState {
  final String error;
  LocationPermissionRequestFailed({
    required this.error,
    required String currentLocation,
    required Position? currentPosition,
  }) : super(
          currentLocation: currentLocation,
          currentPosition: currentPosition,
        );
}

class LocationPermissionDeniedForever extends LocationState {
  LocationPermissionDeniedForever(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class FetchingUserLocation extends LocationState {
  FetchingUserLocation(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationFetched extends LocationState {
  LocationFetched(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationFetchFailed extends LocationState {
  final String error;

  LocationFetchFailed(
      {required String currentLocation,
      required Position? currentPosition,
      required this.error})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}

class LocationPermissionGranted extends LocationState {
  LocationPermissionGranted(
      {required String currentLocation, required Position? currentPosition})
      : super(
            currentLocation: currentLocation, currentPosition: currentPosition);
}
