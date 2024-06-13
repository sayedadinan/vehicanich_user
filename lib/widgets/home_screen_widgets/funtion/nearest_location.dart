import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vehicanich/blocs/user_location/bloc/location_bloc.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371; // Radius of the Earth in km
  final dLat = (lat2 - lat1) * pi / 180;
  final dLon = (lon2 - lon1) * pi / 180;
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1 * pi / 180) *
          cos(lat2 * pi / 180) *
          sin(dLon / 2) *
          sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final distance = R * c; // Distance in km
  return distance;
}

Future<List<QueryDocumentSnapshot<Object?>>> fetchNearestShops(
    BuildContext context) async {
  Position? userCurrentLocation =
      BlocProvider.of<LocationBloc>(context).state.currentPosition;
  if (userCurrentLocation != null) {
    final userLatitude = userCurrentLocation.latitude;
    final userLongitude = userCurrentLocation.longitude;
    final shops = await ShopReference()
        .shopCollectionReference()
        .where(Shopkeys.isApproved, isEqualTo: true)
        .where(Shopkeys.isRejected, isEqualTo: false)
        .get();
    final List<QueryDocumentSnapshot<Object?>> nearestShops = [];
    for (var shop in shops.docs) {
      final GeoPoint shopLatAndLang = shop[Shopkeys.shoplocation];
      final shopLat = shopLatAndLang.latitude;
      final shopLong = shopLatAndLang.longitude;
      final distance =
          calculateDistance(userLatitude, userLongitude, shopLat, shopLong);
      if (distance <= 5) {
        nearestShops.add(shop);
      }
    }
    return nearestShops;
  }
  return [];
}
