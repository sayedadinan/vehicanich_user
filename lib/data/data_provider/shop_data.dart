import 'package:cloud_firestore/cloud_firestore.dart';

class ShopReference {
  CollectionReference<Map<String, dynamic>> shopCollectionReference() {
    final shopcollectionReference =
        FirebaseFirestore.instance.collection('shop_details');
    return shopcollectionReference;
  }
}
