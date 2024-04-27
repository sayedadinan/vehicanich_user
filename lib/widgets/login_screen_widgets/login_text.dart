import 'package:flutter/material.dart';
import 'package:vehicanich/screens/sign_in_screen/sign_in_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/onboarding_widgets/onboarding_texts.dart';

class CustomQuestion extends StatelessWidget {
  const CustomQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.10, context),
        ),
        Text(
          "Don't have an account?",
          style: TextStyle(color: Myappallcolor().textcolor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SigninScreen()));
          },
          child: Text(
            ' Register Now',
            style: TextStyle(color: Myappallcolor().buttonforgroundcolor),
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
          subtitle: '   Welcome back! Glad \nto see you, Again!',
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.14, context),
        )
      ],
    );
  }
}
