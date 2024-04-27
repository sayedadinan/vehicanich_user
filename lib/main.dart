import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/bottom_nav_blocs/bottom_nav_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/blocs/onboarding_blocs/onboarding_bloc.dart';
import 'package:vehicanich/blocs/sign_up_blocs/sign_up_bloc.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/blocs/user_updation_blocs/user_updation_bloc.dart';
import 'package:vehicanich/firebase_options.dart';
import 'package:vehicanich/screens/onboarding/onboarding_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnboardingBloc()),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => BottomNavigationBloc()),
    BlocProvider(create: (context) => SignUpBLoc()),
    BlocProvider(create: (context) => ForgotBloc()),
    BlocProvider(create: (context) => UserDetailsBloc()),
    BlocProvider(create: (context) => UserDetailsUpdationBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Myappallcolor().buttonforgroundcolor),
          useMaterial3: true),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomBar();
          } else {
            return Splashscreen();
          }
        },
      ),
    );
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