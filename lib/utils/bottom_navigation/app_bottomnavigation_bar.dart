import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vehicanich/blocs/bottom_nav_blocs/bottom_nav_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Mymediaquery().mediaqueryheight(0.02, context),
        right: Mymediaquery().mediaqueryheight(0.02, context),
        bottom: Mymediaquery().mediaquerywidth(0.02, context),
        top: Mymediaquery().mediaquerywidth(0.02, context),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Myappallcolor().appbarbackgroundcolor,
            borderRadius: BorderRadius.circular(37)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 15),
          child: GNav(
              backgroundColor: Myappallcolor().appbarbackgroundcolor,
              color: Myappallcolor().colorwhite,
              activeColor: Myappallcolor().appbackgroundcolor,
              tabBackgroundColor: Myappallcolor().colorwhite,
              curve: Curves.easeInOutQuad,
              hoverColor: Myappallcolor().buttonforgroundcolor,
              rippleColor: Myappallcolor().buttonforgroundcolor,
              tabActiveBorder: Border.all(
                  color: Myappallcolor().buttonforgroundcolor, width: 2),
              gap: 8,
              onTabChange: (value) {
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomnavbarPressed(page: value));
              },
              padding: const EdgeInsets.all(5),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
