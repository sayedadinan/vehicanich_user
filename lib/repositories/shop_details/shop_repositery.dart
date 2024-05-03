import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/repositories/data_provider/shop_data.dart';
import 'package:vehicanich/repositories/shop_details/shop_details_keys.dart';

class ShopRepository {
  Future<List<Map<String, dynamic>>> getShopDetails() async {
    try {
      final QuerySnapshot querySnapshot = await ShopReference()
          .shopCollectionReference()
          .where(Shopkeys().isApproved, isEqualTo: true)
          .get();
      final List<Map<String, dynamic>> shopDetailsList = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      print('Successfully fetched data: $shopDetailsList');
      print(shopDetailsList.first[Shopkeys().bodyservicemap]);
      // Map<String, dynamic> map =
      //     shopDetailsList.first[Shopkeys().bodyservicemap];
      // List<String> m = [];
      // List<int> p = [];
      // map.forEach((key, value) {
      //   m.add(key);
      //   p.add(value);
      // });
      // print(m);
      // print(p.toString());
      return shopDetailsList;
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
