// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart'; // Import material.dart for using Navigator

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  Future<User?> sighUpWIthEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('this is that error$e');
    }
    return null;
  }

  Future<User?> sighInWIthEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('error is in this$e');
      print('Some error is there');
    }
    return null;
  }
}

Future<void> sendEmailVerification() async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && !currentUser.emailVerified) {
      await currentUser.sendEmailVerification();
    }
  } catch (e) {
    print('Failed to send verification email: $e');
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  try {
    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    // Navigate to the home page after successful sign-in
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => BottomBar()),
    );
  } catch (e) {
    // Handle sign-in errors here
    print("Error signing in with Google: $e");
    // Display an error message or take appropriate action
  }
}
