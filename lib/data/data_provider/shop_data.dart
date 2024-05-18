import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';

class ShopReference {
  CollectionReference<Map<String, dynamic>> shopCollectionReference() {
    final shopcollectionReference =
        FirebaseFirestore.instance.collection(ReferenceKeys.shopdetails);
    return shopcollectionReference;
  }
}

Future<String> getBookingIdInShop(
    String shopId, String vehicleNumber, String serviceName) async {
  final currentIdInShop = await ShopReference()
      .shopCollectionReference()
      .doc(shopId)
      .collection(Shopkeys.newBooking)
      .where(ReferenceKeys.vehiclenumber, isEqualTo: vehicleNumber)
      .where(ReferenceKeys.servicename, isEqualTo: serviceName)
      .get();
  return currentIdInShop.docs.first.id;
}

void updateBookingInShop(String shopId, String bookingId) {
  final reference = ShopReference()
      .shopCollectionReference()
      .doc(shopId)
      .collection(Shopkeys.newBooking)
      .doc(bookingId);
  reference.update({ReferenceKeys.ordered: false});
}

Future<String> getBookingIdInUser(String userId, String serviceName) async {
  final currentIdUser = await UserDataReference()
      .userCollectionReference()
      .doc(userId)
      .collection(ReferenceKeys.bookings)
      .where(ReferenceKeys.servicename, isEqualTo: serviceName)
      .get();
  return currentIdUser.docs.first.id;
}

void updateBookingInUser(String userId, String bookingId) {
  final userDocRef = UserDataReference()
      .userCollectionReference()
      .doc(userId)
      .collection(ReferenceKeys.bookings)
      .doc(bookingId);
  userDocRef.update({ReferenceKeys.ordered: false});
}

Future<String> getUserId() async {
  return await UserDocId().getUserId();
}

getUserEmail() async {
  return await UserDocId().getUserEmail();
}
