import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/screens/forgot_password/creating_new_password.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/forgot_screen_widgets/custom_question.dart';
import 'package:vehicanich/widgets/forgot_screen_widgets/forgot_text.dart';
// import 'package:vehicanich/widgets/forgot_screen_widgets/otp_field.dart';

class Otpverificationpage extends StatelessWidget {
  const Otpverificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is NavigateToNewpassword) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateNewpasswordscreen()));
          }
        },
        child: Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: Column(
            children: [
              SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
              Forgotpagetexts(
                  text: 'OTP Verification',
                  fontsize: Mymediaquery().mediaquerywidth(0.04, context),
                  fontweight: FontWeight.w600),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
              Forgotpagetexts(
                  text:
                      "Enter the verification code we just sent on your\nemail address.",
                  fontsize: Mymediaquery().mediaquerywidth(0.02, context),
                  fontweight: FontWeight.w400),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.07, context)),
              // OTPTextField(
              //     length: 4,
              //     onChanged: (value) {
              //       print('OTP: $value');
              //     }),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
              CustomButton(
                  color: Myappallcolor().buttonforgroundcolor,
                  function: () =>
                      context.read<LoginBloc>().add(VerifyButtonPressed()),
                  text: 'Verify',
                  fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                  buttontextcolor: Myappallcolor().colorwhite),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.359, context)),
              const Customquestion()
            ],
          ),
        ));
  }
}
