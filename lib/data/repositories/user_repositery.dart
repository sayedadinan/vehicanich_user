// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:vehicanich/data/models/user_model.dart';

class UserRepositery {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  DocumentReference saveUserData(UserModel user, String id) {
    DocumentReference documentReference =
        UserDataReference().userCollectionReference().doc(id);
    documentReference.set(user.toJson());
    addbookingcollection(documentReference);
    return documentReference;
  }

//creating a extra collectionand document in firebase
  addbookingcollection(DocumentReference documentReference) {
    DocumentReference bookingcollectionreference = documentReference
        .collection(ReferenceKeys.bookings)
        .doc(ReferenceKeys.bookingeachday);
    bookingcollectionreference.set({ReferenceKeys.bookingdetails: []});
  }

//users data fetching from this
  Future<UserModel> getuserDetails(String email) async {
    print("Fetching user details for email: $email");
    try {
      final snapshotdata = await db
          .collection(ReferenceKeys.users)
          .where(ReferenceKeys.email, isEqualTo: email)
          .get();
      if (snapshotdata.docs.isEmpty) {
        throw Exception("No user found with email: $email");
      }
      final userData =
          snapshotdata.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
    } catch (e) {
      print("Error fetching user details: $e");
      rethrow;
    }
  }

  updateuser(UserModel user) async {
    try {
      await db
          .collection(ReferenceKeys.users)
          .doc(user.id)
          .update(user.toJson());
    } catch (e) {
      print('error is there for updation $e');
    }
  }

  Future<void> saveUserEmailToSharedPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  Future<void> removeUserEmailFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
  }
}
