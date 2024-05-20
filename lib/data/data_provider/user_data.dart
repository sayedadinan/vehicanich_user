import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich/data/data_provider/keys.dart';

class UserDataReference {
  CollectionReference<Map<String, dynamic>> userCollectionReference() {
    final usercollectionReference =
        FirebaseFirestore.instance.collection(ReferenceKeys.users);
    return usercollectionReference;
  }
}

class UserDocId {
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final useremail = prefs.getString('user_email');
    QuerySnapshot<Map<String, dynamic>> querysnapshot =
        await UserDataReference()
            .userCollectionReference()
            .where(ReferenceKeys.email, isEqualTo: useremail)
            .get();
    return querysnapshot.docs.first.id;
  }

  Future<String?> getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email;
    } else {
      return null;
    }
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final useremail = prefs.getString('user_email');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await UserDataReference()
            .userCollectionReference()
            .where(ReferenceKeys.email, isEqualTo: useremail)
            .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.get(ReferenceKeys.userName);
    } else {
      return null;
    }
  }
}
