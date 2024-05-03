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
    return Row(
      children: [
        const Myonboardingsmalltext(
          subtitle: 'Welcome back!',
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.1, context),
        )
      ],
    );
  }
}
