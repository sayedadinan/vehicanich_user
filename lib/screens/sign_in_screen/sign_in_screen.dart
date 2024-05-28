import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/sign_up_blocs/sign_up_bloc.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/screens/verify_screen/verify_email_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_snackbar.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/app_textvalidators.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/login_screen_widgets/login_text.dart';
import 'package:vehicanich/utils/app_custom_button.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passconfController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupKey,
        child: BlocListener<SignUpBLoc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpLoading) {
                Center(
                  child: loader,
                );
              }
              if (state is SignUpError) {
                const CustomSnackBar(
                  message:
                      'with this username or email already a account is exist',
                  backgroundColor: Colors.red,
                ).show(context);
              }

              if (state is SignUpSuccess) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerifyEmail()));
              }
            },
            child: Scaffold(
              backgroundColor: Myappallcolor().appbackgroundcolor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.17, context)),
                    const LoginScreenMainText(),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.05, context)),
                    Inputfield(
                        keyboardType: TextInputType.name,
                        hinttext: 'Username',
                        controller: userNameController,
                        validator: (value) =>
                            Validators().validateEmpty('Username', value)),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    Inputfield(
                        keyboardType: TextInputType.emailAddress,
                        hinttext: 'Email',
                        controller: emailController,
                        validator: (value) =>
                            Validators().validateEmail(value)),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    Inputfield(
                        hinttext: 'password',
                        controller: passwordController,
                        validator: (value) =>
                            Validators().validatePassword(value)),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    Inputfield(
                      hinttext: 'Confirm password',
                      controller: passconfController,
                      validator: (value) => Validators().validatePasswordMatch(
                          passwordController.text, value),
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    CustomButton(
                      bordercolor: Colors.transparent,
                      buttontextcolor: Myappallcolor().colorwhite,
                      text: 'Register',
                      function: () async {
                        if (signupKey.currentState!.validate()) {
                          final user = UserModel(
                            userName: userNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          context
                              .read<SignUpBLoc>()
                              .add(SignUpButtonPressed(user: user));
                        }
                      },
                      fontSize: 0.05,
                      color: Myappallcolor().buttonforgroundcolor,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.03, context)),
                  ],
                ),
              ),
            )));
  }
}
