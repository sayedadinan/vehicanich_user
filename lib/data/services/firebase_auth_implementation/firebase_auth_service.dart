// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich/blocs/image_bloc/bloc/image_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/screens/onboarding/login_or_sign.dart';
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
      log('this is that error$e');
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
  if (googleUser != null) {
    context.read<UserDetailsBloc>().add(UserDetailsFetching(true));
    context.read<ImageBloc>().add(ProfileImageFetching(isGoogleSignIn: true));
    // await UserRepository()
    //     .checkAndCreateUser(googleUser.email, googleUser.displayName!);
  }
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  await UserRepository().saveUserEmailToSharedPreferences(googleUser!.email);
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
    log("Error signing in with Google: $e");
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    await GoogleSignIn().signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Loginorsign()),
      (route) => false,
    );
  } catch (e) {
    log('Error signing out: $e');
    rethrow;
  }
}
