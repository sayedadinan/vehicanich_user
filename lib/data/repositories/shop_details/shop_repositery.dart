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
      final List<Map<String, dynamic>> shopDetailsList =
          querySnapshot.docs.map((DocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add the document ID to the data
        return data;
      }).toList();
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
        return shop[Shopkeys.phone] == shopIdentifier ||
            shop['id'] == shopIdentifier;
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

  Future<Map<dynamic, dynamic>> getAverageRatings() async {
    try {
      final shopCollection =
          FirebaseFirestore.instance.collection(ReferenceKeys.shopdetails);
      QuerySnapshot shopSnapshot = await shopCollection.get();
      Map<dynamic, dynamic> averageRatings = {};
      for (QueryDocumentSnapshot shopDoc in shopSnapshot.docs) {
        dynamic totalRatingSum = 0;
        dynamic ratingCount = 0;
        try {
          CollectionReference rateAndReviewCollection =
              shopDoc.reference.collection(ReferenceKeys.rateAndReview);
          QuerySnapshot rateAndReviewSnapshot =
              await rateAndReviewCollection.get();
          for (QueryDocumentSnapshot rateAndReviewDoc
              in rateAndReviewSnapshot.docs) {
            var rating = rateAndReviewDoc[ReferenceKeys.ratingCount];
            if (rating is String) {
              rating = num.tryParse(rating) ?? 0;
            }
            totalRatingSum += rating ?? 0;
            if (rating != null) {
              ratingCount++;
            }
          }
          dynamic averageRating =
              (ratingCount > 0) ? (totalRatingSum / ratingCount) : 0.0;
          averageRatings[shopDoc.id] = averageRating;
        } catch (e) {
          log('Error fetching rateAndReview data for shop ${shopDoc.id}: $e');
        }
      }
      log('Successfully fetched average ratings: $averageRatings');
      return averageRatings;
    } catch (e) {
      log('Error fetching shop data: $e');
      throw Exception('Error fetching shop data: $e');
    }
  }
  // Future<Map<dynamic, dynamic>>? getAverageRatings(
  //     List<Map<String, dynamic>> shops) async {
  //   try {
  //     Map<String, dynamic> averageRatings = {};

  //     for (Map<String, dynamic> shopDetails in shops) {
  //       dynamic totalRatingSum = 0;
  //       dynamic ratingCount = 0;

  //       try {
  //         String shopId = shopDetails['id'];
  //         CollectionReference rateAndReviewCollection = FirebaseFirestore
  //             .instance
  //             .collection(ReferenceKeys.shopdetails)
  //             .doc(shopId)
  //             .collection(ReferenceKeys.rateAndReview);

  //         QuerySnapshot rateAndReviewSnapshot =
  //             await rateAndReviewCollection.get();

  //         for (QueryDocumentSnapshot rateAndReviewDoc
  //             in rateAndReviewSnapshot.docs) {
  //           var rating = rateAndReviewDoc[ReferenceKeys.ratingCount];
  //           if (rating is String) {
  //             rating = num.tryParse(rating) ?? 0;
  //           }
  //           totalRatingSum += rating ?? 0;
  //           if (rating != null) {
  //             ratingCount++;
  //           }
  //         }

  //         dynamic averageRating =
  //             (ratingCount > 0) ? (totalRatingSum / ratingCount) : 0.0;
  //         averageRatings[shopId] = averageRating;
  //       } catch (e) {
  //         print(
  //             'Error fetching rateAndReview data for shop ${shopDetails['id']}: $e');
  //       }
  //     }

  //     log('Successfully fetched average ratings: $averageRatings');
  //     return averageRatings;
  //   } catch (e) {
  //     log('Error fetching shop data: $e');
  //     throw Exception('Error fetching shop data: $e');
  //   }
  // }

  Future<QuerySnapshot?> ratingsAndReview(String phone) async {
    try {
      final shopId = await shopidgettingwithphone(phone);
      final ratings = await ShopReference()
          .shopCollectionReference()
          .doc(shopId)
          .collection(ReferenceKeys.rateAndReview)
          .get();
      return ratings;
    } catch (e) {
      log('There is an error in ratingsFetching area: $e');
      return null; // Return null in case of an error
    }
  }

  fetchOffDays(String phone) async {
    try {
      final shopId = await shopidgettingwithphone(phone);
      final QuerySnapshot offDaysSnapshot = await ShopReference()
          .shopCollectionReference()
          .doc(shopId)
          .collection(ReferenceKeys.offDay)
          .get();

      List<DateTime> offDays = offDaysSnapshot.docs.map((doc) {
        return (doc[ReferenceKeys.offDate] as Timestamp).toDate();
      }).toList();

      return offDays;
    } catch (e) {
      log('There is an error in fetching off days: $e');
      return 'error';
    }
  }
}
