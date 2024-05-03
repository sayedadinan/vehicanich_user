import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';

class ShopRepository {
  Future<List<Map<String, dynamic>>> getShopDetails(
      String shopIdentifier, String servicemapkey) async {
    try {
      final QuerySnapshot querySnapshot = await ShopReference()
          .shopCollectionReference()
          .where(Shopkeys().isApproved, isEqualTo: true)
          .get();
      List<Map<String, dynamic>> shopDetailsList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> shopDetails = doc.data() as Map<String, dynamic>;
        if (shopDetails.containsKey(servicemapkey)) {
          Map<String, dynamic>? serviceMap = shopDetails[servicemapkey];
          if (serviceMap != null) {
            shopDetailsList.add(shopDetails);
          }
        }
      });
      List<Map<String, dynamic>> filteredList = shopDetailsList.where((shop) {
        return shop['phone'] == shopIdentifier || shop['id'] == shopIdentifier;
      }).toList();
      return filteredList;
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
