import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/blocs/bottom_nav_blocs/bottom_nav_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/blocs/onboarding_blocs/onboarding_bloc.dart';
import 'package:vehicanich/blocs/payment_blocs/bloc/payment_bloc.dart';
import 'package:vehicanich/blocs/sign_up_blocs/sign_up_bloc.dart';
import 'package:vehicanich/blocs/total_bill/bloc/total_bill_bloc.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/blocs/user_updation_blocs/user_updation_bloc.dart';
import 'package:vehicanich/firebase_options.dart';
import 'package:vehicanich/screens/onboarding/onboarding_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
import 'package:vehicanich/utils/constants/stripe_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = stripKey;
  await Stripe.instance.applySettings();
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
    BlocProvider(create: (context) => BodyMaintainceBloc()),
    BlocProvider(create: (context) => BookingBloc()),
    BlocProvider(create: (context) => ChatingBloc()),
    BlocProvider(create: (context) => PaymentBloc()),
    BlocProvider(create: (context) => TotalBillBloc()),
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
      // home: Splashscreen(),
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
