import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:vehicanich/blocs/image_bloc/bloc/image_bloc.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/data/services/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:vehicanich/screens/user_profile.dart/profile_editing_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_showdialogue.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/connectivity_widget/connectivity_widget.dart';
import 'package:vehicanich/widgets/user_profile_widgets/list_tile_widget.dart';
import 'package:vehicanich/widgets/user_profile_widgets/page_row.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserDetailsBloc>().add(UserDetailsFetching());
    context.read<ImageBloc>().add(ProfileImageFetching());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Myappallcolor().appbarbackgroundcolor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const AppText(text: 'Profile', size: 0.07),
              centerTitle: true,
            ),
            body: StreamBuilder(
                stream: checkInternetConnection(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loader;
                  }
                  if (!snapshot.hasData || !snapshot.data!) {
                    return const ConnectivityWidget();
                  }
                  return SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(
                        width: Mymediaquery().mediaquerywidth(0.38, context),
                        height: Mymediaquery().mediaqueryheight(0.17, context),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BlocProvider.of<ImageBloc>(context)
                                    .state
                                    .storedImagePath
                                    .isEmpty
                                ? Image.asset(
                                    'assets/images/user-profile 1.png')
                                : Image.network(
                                    BlocProvider.of<ImageBloc>(context)
                                        .state
                                        .storedImagePath,
                                    fit: BoxFit.cover,
                                  ))),
                    const CustomSizedBoxHeight(0.02),
                    AppText(text: state.userName, size: 0.05),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    Container(
                      decoration: BoxDecoration(
                          color: Myappallcolor().appbackgroundcolor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      width: double.infinity,
                      height: Mymediaquery().mediaqueryheight(0.62, context),
                      child: Column(
                        children: [
                          const CustomSizedBoxHeight(0.04),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Mymediaquery()
                                    .mediaquerywidth(0.04, context),
                                right: Mymediaquery()
                                    .mediaquerywidth(0.04, context)),
                            child: Card(
                              elevation: 10,
                              color: Myappallcolor().appbackgroundcolor,
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const CustomSizedBoxHeight(0.02),
                                    ProfilePageRow(
                                      mainText: 'Email',
                                      valueText: state.email,
                                    ),
                                    const CustomSizedBoxHeight(0.003),
                                    const Divider(indent: 20, endIndent: 20),
                                    const ProfilePageRow(
                                      mainText: 'password',
                                      valueText: '****00',
                                    ),
                                    const CustomSizedBoxHeight(0.02),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const CustomSizedBoxHeight(0.02),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  FadeTransitionPageRoute(
                                      child: const ProfileEditingPage()));
                            },
                            child: const ProfileList(
                                text: 'edit or update', icon: Icons.edit),
                          ),
                          const CustomSizedBoxHeight(0.01),
                          const ProfileList(
                            text: 'contact us',
                            icon: Icons.phone,
                          ),
                          const CustomSizedBoxHeight(0.01),
                          GestureDetector(
                            onTap: () {},
                            child: const ProfileList(
                              text: 'Privacy Policy',
                              icon: Icons.privacy_tip,
                            ),
                          ),
                          const CustomSizedBoxHeight(0.01),
                          const ProfileList(
                            text: 'About',
                            icon: Icons.abc,
                          ),
                          const CustomSizedBoxHeight(0.01),
                          TapBounceContainer(
                            onTap: () {
                              CustomShowdialogue.showCustomDialog(context,
                                  title: 'Warning',
                                  message: 'Are you sure for logout',
                                  type: DialogType.error,
                                  secondButtonText: 'logout',
                                  showSecondButton: true,
                                  onSecondButtonPressed: () {
                                signOut(context);
                                final snackBar = SnackBar(
                                  padding: const EdgeInsets.all(26),
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'On logout',
                                    message: 'now you logout from vehicanich',
                                    contentType: ContentType.warning,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              });
                            },
                            child: const ProfileList(
                              text: 'log out',
                              icon: Icons.logout,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]));
                }));
      },
    );
  }
}
