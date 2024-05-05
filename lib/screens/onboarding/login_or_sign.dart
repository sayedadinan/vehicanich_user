import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/onboarding_blocs/onboarding_bloc.dart';
import 'package:vehicanich/screens/login_screen/login_screen.dart';
import 'package:vehicanich/screens/sign_in_screen/sign_in_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/widgets/onboarding_widgets/onboarding_texts.dart';

class Loginorsign extends StatelessWidget {
  const Loginorsign({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingBlocState>(
        listener: (context, state) {
          if (state is NavigatetoLoginPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Loginscreen()));
          }
          if (state is Navigatetosignpage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SigninScreen()));
          }
        },
        child: Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Mymediaquery().mediaqueryheight(0.1, context),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Mymediaquery().mediaquerywidth(0.09, context)),
                      child: Myonboardmaintitle(
                        size: Mymediaquery().mediaquerywidth(0.12, context),
                        textcolor: Myappallcolor().colorwhite,
                        title: 'VEHI-CANICH',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Mymediaquery().mediaqueryheight(0.5, context),
                ),
                Container(
                  height: Mymediaquery().mediaqueryheight(0.4, context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Myappallcolor().appbarbackgroundcolor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(58),
                        topRight: Radius.circular(58),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.08, context),
                      ),
                      CustomButton(
                        bordercolor: Colors.transparent,
                        buttontextcolor: Myappallcolor().colorwhite,
                        text: 'Login',
                        function: () => context
                            .read<OnboardingBloc>()
                            .add(LoginButtonPressed()),
                        fontSize:
                            Mymediaquery().mediaqueryheight(0.02, context),
                        color: Myappallcolor().buttonforgroundcolor,
                      ),
                      SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context),
                      ),
                      CustomButton(
                        bordercolor: Colors.white,
                        buttontextcolor: Myappallcolor().colorwhite,
                        text: 'Register',
                        function: () => context
                            .read<OnboardingBloc>()
                            .add((Signinbuttonpressed())),
                        fontSize:
                            Mymediaquery().mediaqueryheight(0.02, context),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
