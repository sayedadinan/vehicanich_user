// user_repository.dart
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/data_provider/user_data.dart';
import 'package:vehicanich/data/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Saves user data to Firestore.
  Future<DocumentReference> saveUserData(UserModel user, String id) async {
    final DocumentReference documentReference =
        UserDataReference().userCollectionReference().doc(id);
    await documentReference.set(user.toJson());
    await _addBookingCollection(documentReference);
    return documentReference;
  }

  /// Creates an additional booking collection and document in Firestore.
  Future<void> _addBookingCollection(
      DocumentReference documentReference) async {
    final DocumentReference bookingCollectionReference = documentReference
        .collection(ReferenceKeys.bookings)
        .doc(ReferenceKeys.bookingeachday);
    await bookingCollectionReference.set({ReferenceKeys.bookingdetails: []});
  }

  /// Fetches user details from Firestore based on email.
  Future<UserModel> getuserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('user_email');
    log("Fetching user details for email: $email");
    try {
      final snapshot = await _db
          .collection(ReferenceKeys.users)
          .where('Email', isEqualTo: email)
          .get();
      if (snapshot.docs.isEmpty) {
        throw Exception("No user found with email: $email");
      }
      final userData =
          snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
    } catch (e) {
      log("Error fetching user details: $e");
      rethrow;
    }
  }

  /// Updates user data in Firestore.
  Future<void> updateuser(UserModel user) async {
    try {
      final userId = await UserDocId().getUserId();
      await _db
          .collection(ReferenceKeys.users)
          .doc(userId)
          .update(user.toJson());
    } catch (e) {
      log('error is there for updation $e');
      rethrow;
    }
  }

  /// Saves user email to SharedPreferences.
  Future<void> saveUserEmailToSharedPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  /// Removes user email from SharedPreferences.
  Future<void> removeUserEmailFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
  }

  Future<List<Map<String, dynamic>>> userMybookings() async {
    try {
      final userId = await UserDocId().getUserId();
      final userDocRef = UserDataReference()
          .userCollectionReference()
          .doc(userId)
          .collection(ReferenceKeys.bookings)
          .where(ReferenceKeys.ordered, isEqualTo: true);
      final querySnapshot = await userDocRef.get();
      final List<Map<String, dynamic>> bookings = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();
      log('this all fetched$bookings');
      return bookings;
    } catch (e) {
      log('Error fetching user bookings: $e');
      rethrow; // Rethrow the error to handle it further up the call stack
    }
  }

  Future<List<Map<String, dynamic>>> userCompletedBooking() async {
    try {
      final userId = await UserDocId().getUserId();
      final userDocRef = UserDataReference()
          .userCollectionReference()
          .doc(userId)
          .collection(ReferenceKeys.bookings)
          .where(ReferenceKeys.ordered, isEqualTo: false);
      final querySnapshot = await userDocRef.get();
      final List<Map<String, dynamic>> bookings = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();
      log('this all fetched$bookings');
      return bookings;
    } catch (e) {
      log('Error fetching user bookings: $e');
      rethrow; // Rethrow the error to handle it further up the call stack
    }
  }
}
