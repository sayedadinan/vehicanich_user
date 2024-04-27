// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vehicanich/utils/app_colors.dart';
// import 'package:vehicanich/utils/app_snackbar.dart';
// import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
// import 'package:vehicanich/utils/mediaquery.dart';

// class VerifyEmailPage extends StatefulWidget {
//   const VerifyEmailPage({Key? key}) : super(key: key);

//   @override
//   _VerifyEmailPageState createState() => _VerifyEmailPageState();
// }

// class _VerifyEmailPageState extends State<VerifyEmailPage> {
//   late User? _user;
//   bool _isEmailVerified = false;

//   @override
//   void initState() {
//     super.initState();
//     _user = FirebaseAuth.instance.currentUser;
//     if (_user != null && !_user!.emailVerified) {
//       sendVerificationEmail();
//     } else {
//       setState(() {
//         _isEmailVerified = true;
//       });
//     }
//   }

//   final user = FirebaseAuth.instance.currentUser!.reload();
//   Future<void> sendVerificationEmail() async {
//     try {
//       await _user!.sendEmailVerification();
//       setState(() {
//         _isEmailVerified =
//             false; // Set to false as email verification is not complete yet
//       });
//     } catch (e) {
//       print('Failed to send verification email: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Myappallcolor().appbackgroundcolor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           'Verify Email',
//           style: TextStyle(color: Myappallcolor().colorwhite),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _isEmailVerified
//                   ? 'Your email has been verified.'
//                   : 'An email verification link has been sent to ${_user!.email}.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Myappallcolor().colorwhite,
//                   fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
//             ),
//             const SizedBox(height: 20),
//             if (!_isEmailVerified)
//               ElevatedButton(
//                 onPressed: sendVerificationEmail,
//                 child: Text(
//                   'Resend Verification Email',
//                 ),
//               ),
//             ElevatedButton(
//               onPressed: navigating,
//               child: Text(
//                 'continue',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   navigating() async {
//     final user = FirebaseAuth.instance.currentUser; // Retrieve user here
//     print('arshad ${user!.emailVerified}');
//     print('worded');
//     if (user.emailVerified) {
//       await Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => BottomBar()));
//     } else {
//       print('it is not verified');
//       CustomSnackBar(
//               message: 'its not verified',
//               backgroundColor: Myappallcolor().emergencybuttoncolor)
//           .show(context);
//     }
//   }
// }import 'dart:async';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/services/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:vehicanich/utils/app_colors.dart';
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
    // TODO: implement initState
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
                height: Mymediaquery().mediaqueryheight(0.02, context),
              ),
              const Icon(
                Icons.email_outlined,
                size: 150,
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.02, context),
              ),
              Text(
                'Verify your email address',
                style: TextStyle(
                    color: Myappallcolor().colorwhite,
                    fontSize: Mymediaquery().mediaqueryheight(0.03, context)),
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.06, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Mymediaquery().mediaqueryheight(0.05, context),
                  ),
                  Text(
                    'We have just send email verification link on \n your email. please check email and click on\n that link to verify your email address.',
                    style: TextStyle(
                        color: Myappallcolor().colorwhite,
                        fontSize:
                            Mymediaquery().mediaqueryheight(0.02, context)),
                  ),
                ],
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.03, context),
              ),
              Text(
                'A verification message has been sent to your email',
                style: TextStyle(
                    color: Myappallcolor().colorwhite,
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context)),
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.02, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 34),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      sendVerificationEmail();
                    },
                    child: Text(
                      'Resent Email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      checkEmailVerified();
                    },
                    child: const Text(
                      'continue',
                    ),
                  ),
                ),
              ),
            ],
          ));
}
