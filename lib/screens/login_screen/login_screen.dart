import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/screens/forgot_password/forgot_password.dart';
import 'package:vehicanich/data/services/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_textvalidators.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_googlebutton.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/login_screen_widgets/custom_divider.dart';
import 'package:vehicanich/widgets/login_screen_widgets/forgot_button.dart';
import 'package:vehicanich/widgets/login_screen_widgets/login_text.dart';
import 'package:vehicanich/utils/app_custom_button.dart';

// ignore: must_be_immutable
class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuthService auth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(listener: (context, state) {
      if (state is NavigateToForgetPage) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Forgotpasswordscreen()));
      }
      if (state is NavigateToHome) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBar()),
          (Route<dynamic> route) => false,
        );
      }
      if (state is LoginErrorHappened) {
        log('worked');
      }
    }, child: BlocBuilder<LoginBloc, LoginBlocState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return loader;
        }
        return Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Column(
                children: [
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.2, context)),
                  const LoginScreenMainText(),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.05, context)),
                  Inputfield(
                      keyboardType: TextInputType.emailAddress,
                      hinttext: 'Enter your email',
                      controller: emailController,
                      validator: (value) => Validators().validateEmail(value)),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  Inputfield(
                      hinttext: 'Enter your password',
                      controller: passwordController,
                      validator: (value) =>
                          Validators().validatePassword(value)),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.01, context)),
                  Forgetbutton(
                    function: () =>
                        context.read<LoginBloc>().add(ForgotButtonPressed()),
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.06, context)),
                  CustomButton(
                    bordercolor: Colors.transparent,
                    buttontextcolor: Myappallcolor().colorwhite,
                    text: 'Login',
                    function: () {
                      context.read<LoginBloc>().add(LoginScreenButtonPressed(
                          context: context,
                          formkey: loginKey,
                          email: emailController,
                          password: passwordController));
                    },
                    fontSize: 0.05,
                    color: Myappallcolor().buttonforgroundcolor,
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  const CustomDivider(),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  CustomGoogleButton(
                      bordercolor: Myappallcolor().colorwhite,
                      color: Colors.transparent,
                      function: () {
                        signInWithGoogle(context);
                      },
                      text: 'Login with google',
                      fontSize: 0.05,
                      buttontextcolor: Myappallcolor().colorwhite),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  const CustomQuestion()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
