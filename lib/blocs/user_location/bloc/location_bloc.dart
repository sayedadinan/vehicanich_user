import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc()
      : super(LocationInitial(currentLocation: '', currentPosition: null)) {
    on<GetLocationPermission>(_getlocationPermission);
    on<FetchUserLocation>(_fetchUserLocation);
    log('LocationBloc initialized');
  }

  Future<void> _getlocationPermission(
      GetLocationPermission event, Emitter<LocationState> emit) async {
    try {
      bool locationEnabled = await Geolocator.isLocationServiceEnabled();
      log('Location service enabled: $locationEnabled');
      if (!locationEnabled) {
        emit(LocationServiceNotEnabled(
            currentLocation: '', currentPosition: null));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      log('Location permission: $permission');
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        log('Requested permission: $permission');
        if (permission == LocationPermission.denied) {
          emit(LocationPermissionDenied(
              currentLocation: '', currentPosition: null));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(LocationPermissionDeniedForever(
            currentLocation: '', currentPosition: null));
        return;
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        emit(LocationPermissionGranted(
            currentLocation: '', currentPosition: null));
        add(FetchUserLocation());
      }
    } catch (e) {
      log('Error requesting location permission: $e');
      emit(LocationPermissionRequestFailed(
        error: e.toString(),
        currentLocation: '',
        currentPosition: null,
      ));
    }
  }

  Future<void> _fetchUserLocation(
      FetchUserLocation event, Emitter<LocationState> emit) async {
    emit(FetchingUserLocation(currentLocation: '', currentPosition: null));
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log('Fetched user position: $position');

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      log('Fetched placemarks: $placemarks');
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        final locality = place.locality;
        emit(LocationFetched(
            currentLocation: locality ?? 'Unknown location',
            currentPosition: position));
      } else {
        emit(LocationFetchFailed(
            currentLocation: '',
            currentPosition: null,
            error: 'No placemarks found'));
      }
    } catch (e) {
      log('Error fetching user location: $e');
      emit(LocationFetchFailed(
          currentLocation: '', currentPosition: null, error: e.toString()));
    }
  }
}
