import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc()
      : super(LocationInitial(currentLocation: '', currentPosition: null)) {
    on<GetLocationPermission>(getlocationPermission);
    on<FetchUserLocation>(fetchUserLocation);
  }
  getlocationPermission(
      GetLocationPermission event, Emitter<LocationState> emit) async {
    bool locationEnabled;
    LocationPermission permission;
    locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      emit(LocationServiceNotEnabled(
          currentLocation: '', currentPosition: null));
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationServiceNotEnabled(
            currentLocation: '', currentPosition: null));
        return;
      }
    }
    add(FetchUserLocation());
  }

  fetchUserLocation(
      FetchUserLocation event, Emitter<LocationState> emit) async {
    emit(FetchingUserLocation(currentLocation: '', currentPosition: null));
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        final locality = place.locality;
        emit(LocationState(
            currentLocation: locality!, currentPosition: position));
      }).catchError((e) {
        log(e);
      });
    });
  }
}
