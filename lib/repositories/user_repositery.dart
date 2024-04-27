import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich/models/user_model.dart';

class UserRepositery {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  saveUserData(UserModel user, id) {
    db.collection('users').doc(id).set(user.toJson());
  }

  Future<UserModel> getuserDetails(String email) async {
    print("Fetching user details for email: $email");
    try {
      final snapshotdata =
          await db.collection('users').where('Email', isEqualTo: email).get();
      if (snapshotdata.docs.isEmpty) {
        throw Exception("No user found with email: $email");
      }
      final userData =
          snapshotdata.docs.map((e) => UserModel.fromSnapshot(e)).single;
      print("Parsed user data: $userData");
      return userData;
    } catch (e) {
      print("Error fetching user details: $e");
      throw e; // Rethrow the error for the caller to handle
    }
  }

  updateuser(UserModel user) async {
    try {
      await db.collection('users').doc(user.id).update(user.toJson());
    } catch (e) {
      print('error is there for updation $e');
    }
  }
}
