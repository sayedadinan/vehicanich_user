import 'package:flutter/material.dart';
import 'package:vehicanich/screens/sign_in_screen/sign_in_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/onboarding_widgets/onboarding_texts.dart';

class CustomQuestion extends StatelessWidget {
  const CustomQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
              color: Myappallcolor().textcolor,
              fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                FadeTransitionPageRoute(child: SigninScreen()));
          },
          child: Text(
            ' Register Now',
            style: TextStyle(
                color: Myappallcolor().buttonforgroundcolor,
                fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
          ),
        )
      ],
    );
  }
}

class LoginScreenMainText extends StatelessWidget {
  const LoginScreenMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Mymediaquery().mediaquerywidth(0.05, context)),
      child: const Row(
        children: [
          Myonboardingsmalltext(
            subtitle: ' Welcome back! \n Glad to see you',
          ),
        ],
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Mymediaquery().mediaquerywidth(0.05, context)),
      child: const Row(
        children: [
          Myonboardingsmalltext(
            subtitle: ' Create an account \n And Care your car',
          ),
        ],
      ),
    );
  }
}
