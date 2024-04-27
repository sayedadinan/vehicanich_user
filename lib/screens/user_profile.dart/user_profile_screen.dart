import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/screens/user_profile.dart/profile_editing_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/user_profile_widgets/text_containers.dart';
import 'package:vehicanich/widgets/user_profile_widgets/user_appbar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDetailsBloc = BlocProvider.of<UserDetailsBloc>(context);
    userDetailsBloc.add(UserDataLoaded(email: currentUser!.email!));
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsLoading) {
          return Scaffold(
            backgroundColor: Myappallcolor().appbackgroundcolor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserDetailsLoaded) {
          final user = state.user;
          return Scaffold(
            backgroundColor: Myappallcolor().appbackgroundcolor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  Mymediaquery().mediaqueryheight(0.08, context)),
              child: const CustomAppbarForProfile(
                text: 'Profile',
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Mymediaquery().mediaquerywidth(0.04, context),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.04, context)),
                  Row(
                    children: [
                      SizedBox(
                          width: Mymediaquery().mediaquerywidth(0.11, context)),
                      SizedBox(
                          width: Mymediaquery().mediaquerywidth(0.18, context),
                          height:
                              Mymediaquery().mediaqueryheight(0.18, context),
                          child:
                              Image.asset('assets/images/user-profile 1.png')),
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.04, context)),
                  TextContainer(text: user.userName),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  TextContainer(text: user.email),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  TextContainer(text: user.password),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  CustomButton(
                      color: Myappallcolor().buttonforgroundcolor,
                      function: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileEditingPage()));
                      },
                      text: 'Edit',
                      fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                      buttontextcolor: Myappallcolor().colorblack)
                ],
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
}
