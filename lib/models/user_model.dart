import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String password;
  UserModel({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
  });
  toJson() {
    return {
      "id": id,
      "UserName": userName,
      "Email": email,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        userName: data['UserName'],
        email: data['Email'],
        password: data['Password']);
  }
}
