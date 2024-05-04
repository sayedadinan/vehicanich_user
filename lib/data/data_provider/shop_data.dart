import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/data/data_provider/keys.dart';

class ShopReference {
  CollectionReference<Map<String, dynamic>> shopCollectionReference() {
    final shopcollectionReference =
        FirebaseFirestore.instance.collection(ReferenceKeys.shopdetails);
    return shopcollectionReference;
  }
}
