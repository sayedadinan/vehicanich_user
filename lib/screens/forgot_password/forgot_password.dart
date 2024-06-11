// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
// import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_event.dart';
// import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_state.dart';
// import 'package:vehicanich/utils/app_colors.dart';
// import 'package:vehicanich/utils/app_custom_button.dart';
// import 'package:vehicanich/utils/app_custom_loader.dart';
// import 'package:vehicanich/utils/app_snackbar.dart';
// import 'package:vehicanich/utils/app_textfields.dart';
// import 'package:vehicanich/utils/mediaquery.dart';
// import 'package:vehicanich/widgets/forgot_screen_widgets/forgot_text.dart';

// class Forgotpasswordscreen extends StatelessWidget {
//   const Forgotpasswordscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailcontroller = TextEditingController();
//     return BlocListener<ForgotBloc, ForgotButtonState>(
//         listener: (context, state) {
//           if (state is EmailVerified) {
//             Navigator.of(context).pop();
//           }

//           if (state is Emailtakingerror) {
//             CustomSnackBar(message: state.error, backgroundColor: Colors.red);
//           }
//           // if (state is NavigateToOtpPage) {
//           //   Navigator.push(context,
//           //       MaterialPageRoute(builder: (context) => Otpverificationpage()));
//           // }
//       builder: (context, state) {
//         if (state is EmailLoadingState) {
//           log('worked');
//           return Center(
//             child: loader,
//           );
//         }

//        return Scaffold(
//           backgroundColor: Myappallcolor().appbackgroundcolor,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: Mymediaquery().mediaqueryheight(0.3, context)),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: Mymediaquery().mediaquerywidth(0.03, context)),
//                   child: Forgotpagetexts(
//                     text: 'Forgot Password?',
//                     fontsize: Mymediaquery().mediaquerywidth(0.06, context),
//                     fontweight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                     height: Mymediaquery().mediaqueryheight(0.01, context)),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: Mymediaquery().mediaquerywidth(0.03, context)),
//                   child: Forgotpagetexts(
//                     text:
//                         "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
//                     fontsize: Mymediaquery().mediaquerywidth(0.04, context),
//                     fontweight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(
//                     height: Mymediaquery().mediaqueryheight(0.06, context)),
//                 Inputfield(
//                   controller: emailcontroller,
//                   label: 'Enter your email',
//                   hinttext: 'email',
//                 ),
//                 SizedBox(
//                     height: Mymediaquery().mediaqueryheight(0.04, context)),
//                 CustomButton(
//                   bordercolor: Colors.transparent,
//                   color: Myappallcolor().buttonforgroundcolor,
//                   buttontextcolor: Myappallcolor().colorwhite,
//                   fontSize: 0.05,
//                   function: () => context.read<ForgotBloc>().add(
//                       SendCodeButtonPressed(emailcontroller: emailcontroller)),
//                   text: 'Send Code',
//                 ),
//               ],
//             ),
//           ),
//   ))
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_event.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_state.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_snackbar.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/forgot_screen_widgets/forgot_text.dart';

class Forgotpasswordscreen extends StatelessWidget {
  const Forgotpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    return BlocConsumer<ForgotBloc, ForgotButtonState>(
      listener: (context, state) {
        if (state is EmailVerified) {
          Navigator.of(context).pop();
        }

        if (state is Emailtakingerror) {
          CustomSnackBar(message: state.error, backgroundColor: Colors.red);
        }
        // if (state is NavigateToOtpPage) {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => Otpverificationpage()));
        // }
      },
      builder: (context, state) {
        if (state is EmailLoadingState) {
          log('worked');
          return Center(
            child: loader,
          );
        }

        return Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Mymediaquery().mediaqueryheight(0.3, context)),
                Padding(
                  padding: EdgeInsets.only(
                      left: Mymediaquery().mediaquerywidth(0.03, context)),
                  child: Forgotpagetexts(
                    text: 'Forgot Password?',
                    fontsize: Mymediaquery().mediaquerywidth(0.06, context),
                    fontweight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                Padding(
                  padding: EdgeInsets.only(
                      left: Mymediaquery().mediaquerywidth(0.03, context)),
                  child: Forgotpagetexts(
                    text:
                        "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                    fontsize: Mymediaquery().mediaquerywidth(0.04, context),
                    fontweight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.06, context)),
                Inputfield(
                  controller: emailcontroller,
                  label: 'Enter your email',
                  hinttext: 'email',
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context)),
                CustomButton(
                  bordercolor: Colors.transparent,
                  color: Myappallcolor().buttonforgroundcolor,
                  buttontextcolor: Myappallcolor().colorwhite,
                  fontSize: 0.05,
                  function: () => context.read<ForgotBloc>().add(
                      SendCodeButtonPressed(emailcontroller: emailcontroller)),
                  text: 'Send Code',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
