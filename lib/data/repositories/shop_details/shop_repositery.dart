import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';

class ShopRepository {
  Future<List<Map<String, dynamic>>> getShopDetails() async {
    try {
      final QuerySnapshot querySnapshot = await ShopReference()
          .shopCollectionReference()
          .where(Shopkeys.isApproved, isEqualTo: true)
          .get();
      final List<Map<String, dynamic>> shopDetailsList = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // print('Successfully fetched data: $shopDetailsList');
      // print(shopDetailsList.first[Shopkeys().bodyservicemap]);
      Map<String, dynamic> map = shopDetailsList.first[Shopkeys.bodyservicemap];
      List<String> m = [];
      List<int> p = [];
      map.forEach((key, value) {
        m.add(key);
        p.add(value);
      });
      print(m);
      print(p.toString());
      return shopDetailsList;
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }

  shopidgettingwithphone(phone) async {
    final QuerySnapshot querySnapshot = await ShopReference()
        .shopCollectionReference()
        .where(Shopkeys.phone, isEqualTo: phone)
        .get();
    final docid = querySnapshot.docs.first.id;
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
          Map<String, dynamic>? serviceMap = shopDetails[servicemapkey];
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
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
