import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/screens/login_screen/login_screen.dart';
import 'package:vehicanich/screens/onboarding/login_or_sign.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';

Future<void> checkingforsplash(context) async {
  log('worked');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(ReferenceKeys.sharedPrefEmail);
  log('this email for $data');
  await Future.delayed(const Duration(seconds: 2));

  if (data == null) {
    log('data null worked');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Loginorsign()),
      (Route<dynamic> route) => false,
    );
    return;
  } else if (data.isEmpty) {
    log('data isEmpty worked');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Loginscreen()),
      (Route<dynamic> route) => false,
    );
  }
  if (data.isNotEmpty) {
    Navigator.of(context).push(FadeTransitionPageRoute(child: BottomBar()));
  }
}
