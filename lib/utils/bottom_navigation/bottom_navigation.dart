import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/bottom_nav_blocs/bottom_nav_bloc.dart';
import 'package:vehicanich/screens/home_screen/home_screens.dart';
import 'package:vehicanich/screens/search_screen/search_screen.dart';
import 'package:vehicanich/screens/user_bookings/user_bookings.dart';
import 'package:vehicanich/screens/user_profile.dart/user_profile_screen.dart';
import 'package:vehicanich/utils/bottom_navigation/app_bottomnavigation_bar.dart';
import 'package:vehicanich/utils/app_colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> tabs = [
    const HomeScreen(),
    const SearchScreen(),
    const UserBookingsPage(),
    const UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: tabs[BlocProvider.of<BottomNavigationBloc>(context, listen: true)
          .state
          .page],
      bottomNavigationBar: const CustomBottomNavigationbar(),
    );
  }
}
