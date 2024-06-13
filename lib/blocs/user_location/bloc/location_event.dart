part of 'location_bloc.dart';

sealed class LocationEvent {}

final class GetLocationPermission extends LocationEvent {}

final class FetchUserLocation extends LocationEvent {}
