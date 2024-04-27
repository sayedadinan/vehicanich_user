import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/onboarding_blocs/onboarding_bloc.dart';
import 'package:vehicanich/screens/onboarding/login_or_sign.dart';
import 'package:vehicanich/screens/onboarding/onboarding_items.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/onboarding_widgets/onboarding_image.dart';
import 'package:vehicanich/widgets/onboarding_widgets/onboarding_texts.dart';
import 'package:vehicanich/widgets/onboarding_widgets/smoothindicator.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});
  final controller = OnboardingItems();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingBlocState>(
        listener: (context, state) {
          if (state is NavigatetosecondOnboardingPage) {
            pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn);
          }
          if (state is NavigatetoLoginorSignPage) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Loginorsign(),
                ));
          }
        },
        child: Scaffold(
          bottomSheet: Smoothindicatorwithbutton(
            controller: controller,
            pageController: pageController,
          ),
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: PageView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.1, context)),
                    Myonboardmaintitle(
                      size: Mymediaquery().mediaquerywidth(0.06, context),
                      title: controller.items[index].title,
                      textcolor: Myappallcolor().textcolor,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.05, context)),
                    Onboardingfirstimage(path: controller.items[index].image),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.09, context)),
                    Myonboardingsmalltext(
                        subtitle: controller.items[index].subtitle)
                  ],
                );
              },
              controller: pageController),
        ));
  }
}






















// project_name/
// ├── android/
// ├── ios/
// ├── lib/
// │   ├── blocs/
// │   │   ├── authentication/
// │   │   │   ├── authentication_bloc.dart
// │   │   │   └── authentication_event.dart
// │   │   ├── data/
// │   │   │   ├── data_bloc.dart
// │   │   │   └── data_event.dart
// │   │   └── ...
// │   ├── models/
// │   │   ├── user.dart
// │   │   └── ...
// │   ├── repositories/
// │   │   ├── authentication_repository.dart
// │   │   └── data_repository.dart
// │   ├── screens/
// │   │   ├── login_screen.dart
// │   │   ├── home_screen.dart
// │   │   └── ...
// │   ├── services/
// │   │   ├── firebase_auth_service.dart
// │   │   ├── firebase_firestore_service.dart
// │   │   └── ...
// │   ├── utils/
// │   │   ├── firebase_utils.dart
// │   │   └── ...
// │   ├── widgets/
// │   │   ├── common_widget1.dart
// │   │   ├── common_widget2.dart
// │   │   └── ...
// │   ├── app.dart
// │   ├── main.dart
// ├── test/
// ├── pubspec.yaml
// ├── README.md
// └── ...
