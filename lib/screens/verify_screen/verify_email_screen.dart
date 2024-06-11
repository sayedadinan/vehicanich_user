import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/data/services/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_snackbar.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendEmailVerification();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      CustomSnackBar(
          message: e.toString(),
          backgroundColor: Myappallcolor().emergencybuttoncolor);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? BottomBar()
      : Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          appBar: AppBar(
            backgroundColor: Myappallcolor().appbackgroundcolor,
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.05, context),
              ),
              const Icon(
                Icons.email_outlined,
                size: 150,
                color: Colors.white,
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.02, context),
              ),
              Text(
                'Verify your email address \n',
                style: TextStyle(
                    color: Myappallcolor().colorwhite,
                    fontSize: Mymediaquery().mediaquerywidth(0.05, context)),
              ),
              Text(
                'After opening email you can click continue',
                style: TextStyle(
                    color: Myappallcolor().colorwhite,
                    fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.04, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 34),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    bordercolor: Colors.transparent,
                    buttontextcolor: Colors.black,
                    color: Myappallcolor().textcolor,
                    fontSize: 0.04,
                    text: 'Resent Email',
                    function: () {
                      sendVerificationEmail();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 34),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    bordercolor: Colors.transparent,
                    buttontextcolor: Colors.black,
                    color: Myappallcolor().buttonforgroundcolor,
                    fontSize: 0.04,
                    text: 'Continue',
                    function: () {
                      checkEmailVerified();
                    },
                  ),
                ),
              ),
            ],
          ));
}
