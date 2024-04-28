import 'package:cloud_firestore/cloud_firestore.dart';

class ShopRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getShopDetails() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('shop_details').get();
      final List<Map<String, dynamic>> shopDetailsList = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();
      print('Successfully fetched data: $shopDetailsList');
      return shopDetailsList;
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
