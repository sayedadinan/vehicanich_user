import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/blocs/bottom_nav_blocs/bottom_nav_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/blocs/forgot_password_blocs/forgot_pass_bloc.dart';
import 'package:vehicanich/blocs/image_bloc/bloc/image_bloc.dart';
import 'package:vehicanich/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich/blocs/offDay_bloc/bloc/offday_bloc.dart';
import 'package:vehicanich/blocs/onboarding_blocs/onboarding_bloc.dart';
import 'package:vehicanich/blocs/payment_blocs/bloc/payment_bloc.dart';
import 'package:vehicanich/blocs/rating_and_review/bloc/ratings_bloc.dart';
import 'package:vehicanich/blocs/search_bloc/bloc/search_bloc.dart';
import 'package:vehicanich/blocs/sign_up_blocs/sign_up_bloc.dart';
import 'package:vehicanich/blocs/total_bill/bloc/total_bill_bloc.dart';
import 'package:vehicanich/blocs/user_details_blocs/user_detail_bloc.dart';
import 'package:vehicanich/blocs/user_updation_blocs/user_updation_bloc.dart';

List<BlocProvider> buildBlocProviders() {
  return [
    BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()),
    BlocProvider<SignUpBLoc>(create: (context) => SignUpBLoc()),
    BlocProvider<ForgotBloc>(create: (context) => ForgotBloc()),
    BlocProvider<UserDetailsBloc>(create: (context) => UserDetailsBloc()),
    BlocProvider<UserDetailsUpdationBloc>(
        create: (context) => UserDetailsUpdationBloc()),
    BlocProvider<BodyMaintainceBloc>(create: (context) => BodyMaintainceBloc()),
    BlocProvider<BookingBloc>(create: (context) => BookingBloc()),
    BlocProvider<ChatingBloc>(create: (context) => ChatingBloc()),
    BlocProvider<PaymentBloc>(create: (context) => PaymentBloc()),
    BlocProvider<TotalBillBloc>(create: (context) => TotalBillBloc()),
    BlocProvider<RatingsBloc>(create: (context) => RatingsBloc()),
    BlocProvider<ImageBloc>(create: (context) => ImageBloc()),
    BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
    BlocProvider<OffdayBloc>(create: (context) => OffdayBloc()),
  ];
}
