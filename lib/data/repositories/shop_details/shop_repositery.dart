import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';

class ShopRepository {
  Future<List<Map<String, dynamic>>> getShopDetails() async {
    try {
      final QuerySnapshot querySnapshot = await ShopReference()
          .shopCollectionReference()
          .where(Shopkeys.isApproved, isEqualTo: true)
          .where(Shopkeys.isRejected, isEqualTo: false)
          .get();
      final List<Map<String, dynamic>> shopDetailsList = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      log('Successfully fetched data: $shopDetailsList');
      return shopDetailsList;
    } catch (e) {
      log('Error fetching data: $e');
      rethrow;
    }
  }

  shopidgettingwithphone(phone) async {
    final QuerySnapshot querySnapshot = await ShopReference()
        .shopCollectionReference()
        .where(Shopkeys.phone, isEqualTo: phone)
        .get();
    final docid = querySnapshot.docs.first.id;
    log('this is shop id $docid');
    return docid;
  }

  Future<List<Map<String, dynamic>>> getShopDetailswithmap(
      String shopIdentifier, String servicemapkey) async {
    try {
      final QuerySnapshot querySnapshot = await ShopReference()
          .shopCollectionReference()
          .where(Shopkeys.isApproved, isEqualTo: true)
          .get();
      List<Map<String, dynamic>> shopDetailsList = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> shopDetails = doc.data() as Map<String, dynamic>;
        if (shopDetails.containsKey(servicemapkey)) {
          List<dynamic> serviceMap = shopDetails[servicemapkey];
          // ignore: unnecessary_null_comparison
          if (serviceMap != null) {
            shopDetailsList.add(shopDetails);
          }
        }
      }
      List<Map<String, dynamic>> filteredList = shopDetailsList.where((shop) {
        return shop['phone'] == shopIdentifier || shop['id'] == shopIdentifier;
      }).toList();
      return filteredList;
    } catch (e) {
      log('Error fetching data s: $e');
      rethrow;
    }
  }

  currentStatus(shopId, vehicleNumber, serviceName) async {
    try {
      final shopData = await ShopReference()
          .shopCollectionReference()
          .doc(shopId)
          .collection(Shopkeys.newBooking)
          .where(ReferenceKeys.vehiclenumber, isEqualTo: vehicleNumber)
          .where(ReferenceKeys.servicename, isEqualTo: serviceName)
          .get();
      return shopData;
    } catch (e) {
      log('current status taking area error$e');
    }
  }

  Future getTotalRatingCounts() async {
    // Reference to the shop collection
    final shopCollection = FirebaseFirestore.instance.collection('shops');

    // Get all shop documents
    QuerySnapshot shopSnapshot = await shopCollection.get();

    // Iterate through each shop document
    for (QueryDocumentSnapshot shopDoc in shopSnapshot.docs) {
      dynamic totalRatingCount = 0;

      // Reference to the rateAndReview sub-collection
      CollectionReference rateAndReviewCollection =
          shopDoc.reference.collection('rateAndReview');

      // Get all rateAndReview documents
      QuerySnapshot rateAndReviewSnapshot = await rateAndReviewCollection.get();

      // Sum the ratingCount fields
      for (QueryDocumentSnapshot rateAndReviewDoc
          in rateAndReviewSnapshot.docs) {
        totalRatingCount += rateAndReviewDoc['ratinCount'] ?? 0;
      }

      // Display or use the totalRatingCount as needed
      log('Total rating count for shop ${shopDoc.id}: $totalRatingCount');
      return shopDoc.id;
    }
  }
}
