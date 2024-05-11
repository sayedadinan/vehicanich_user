// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/screens/login_screen/login_screen.dart';
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
  context.read<LoginBloc>().add(LoginWithGoogleButtonPressed());
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => BottomBar()),
    );
  } catch (e) {
    // Handle sign-in errors here
    print("Error signing in with Google: $e");
    // Display an error message or take appropriate action
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    await GoogleSignIn().signOut();
    // Navigate to the login screen and remove all existing routes
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Loginscreen()),
      (route) => false,
    );
  } catch (e) {
    print('Error signing out: $e');
    rethrow;
  }
}
