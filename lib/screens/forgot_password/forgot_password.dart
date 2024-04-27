import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_event.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_state.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_snackbar.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/forgot_screen_widgets/forgot_text.dart';

class Forgotpasswordscreen extends StatelessWidget {
  Forgotpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    return BlocListener<ForgotBloc, ForgotButtonState>(
        listener: (context, state) {
          if (state is EmailVerified) {
            Navigator.of(context).pop();
          }
          if (state is EmailLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Emailtakingerror) {
            CustomSnackBar(message: state.error, backgroundColor: Colors.red);
          }
          // if (state is NavigateToOtpPage) {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => Otpverificationpage()));
          // }
        },
        child: Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
                Forgotpagetexts(
                  text: 'Forgot Password?',
                  fontsize: Mymediaquery().mediaquerywidth(0.04, context),
                  fontweight: FontWeight.w600,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                Forgotpagetexts(
                  text:
                      "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                  fontsize: Mymediaquery().mediaquerywidth(0.02, context),
                  fontweight: FontWeight.w400,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.07, context)),
                Inputfield(
                  controller: emailcontroller,
                  label: 'Enter your phone',
                  hinttext: '',
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context)),
                CustomButton(
                  color: Myappallcolor().buttonforgroundcolor,
                  buttontextcolor: Myappallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                  function: () => context.read<ForgotBloc>().add(
                      SendCodeButtonPressed(emailcontroller: emailcontroller)),
                  text: 'Send Code',
                ),
              ],
            ),
          ),
        ));
  }
}
