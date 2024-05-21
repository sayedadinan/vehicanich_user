import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicanich/blocs/user_updation_blocs/user_updation_bloc.dart';
import 'package:vehicanich/data/models/user_model.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/user_profile_widgets/user_appbar.dart';

class ProfileEditingPage extends StatefulWidget {
  const ProfileEditingPage({super.key});

  @override
  _ProfileEditingPageState createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDetailsBloc = BlocProvider.of<UserDetailsUpdationBloc>(context);
    userDetailsBloc.add(UserDataFetched(email: currentUser!.email!));

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsUpdationBloc, UserDetailsUpdationState>(
      builder: (context, state) {
        if (state is UserDetailsUpdationButton) {
          Navigator.of(context).pop();
        }
        if (state is UserDetailsLoading) {
          return Scaffold(
            backgroundColor: Myappallcolor().appbackgroundcolor,
            body: Center(child: loader),
          );
        } else if (state is UserDetailsLoaded) {
          final user = state.user;
          nameController.text = user.userName;
          emailController.text = user.email;
          passwordController.text = user.password;
          return Scaffold(
            backgroundColor: Myappallcolor().appbackgroundcolor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  Mymediaquery().mediaqueryheight(0.08, context)),
              child: const CustomAppbarForProfile(
                text: 'Edit Profile',
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Mymediaquery().mediaquerywidth(0.04, context),
                ),
                child: Column(
                  children: [
                    const CustomSizedBoxHeight(0.02),
                    Row(
                      children: [
                        const CustomSizedBoxWidth(0.25),
                        SizedBox(
                            width:
                                Mymediaquery().mediaquerywidth(0.38, context),
                            height:
                                Mymediaquery().mediaqueryheight(0.17, context),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                    'assets/images/user-profile 1.png',
                                    fit: BoxFit.fill))),
                      ],
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.04, context)),
                    Inputfield(
                      icon: const Icon(Icons.edit),
                      hinttext: '',
                      controller: nameController,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.03, context)),
                    Inputfield(
                      icon: const Icon(Icons.edit),
                      hinttext: '',
                      controller: emailController,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.03, context)),
                    Inputfield(
                      icon: const Icon(Icons.edit),
                      hinttext: '',
                      controller: passwordController,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.03, context)),
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.83, context),
                      child: CustomButton(
                          bordercolor: Colors.transparent,
                          color: Myappallcolor().buttonforgroundcolor,
                          function: () async {
                            final usermodel = UserModel(
                                userName: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                            context
                                .read<UserDetailsUpdationBloc>()
                                .add(UserDetailsUpdateButton(user: usermodel));
                          },
                          text: 'Update Details',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.05, context),
                          buttontextcolor: Myappallcolor().colorblack),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Myappallcolor().appbackgroundcolor,
            body: const Center(
              child: Text('Error fetching user details'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
