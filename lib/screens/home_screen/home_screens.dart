import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/user_location/bloc/location_bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/connectivity_widget/connectivity_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/photo_slider_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/shop_list.dart';
import 'package:vehicanich/widgets/search_widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<dynamic, dynamic>>? ratingCountsFuture;
  @override
  void initState() {
    super.initState();
    ratingCountsFuture = ShopRepository().getAverageRatings();
    if (BlocProvider.of<LocationBloc>(context).state.currentLocation.isEmpty) {
      context.read<LocationBloc>().add(GetLocationPermission());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: Mymediaquery().mediaquerywidth(0.56, context)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    text: 'VEHICANICH', size: 0.07, weight: FontWeight.w700),
              ],
            ),
          ),
        ],
        backgroundColor: Myappallcolor().appbackgroundcolor,
        toolbarHeight: 99.0,
      ),
      body: StreamBuilder<bool>(
        stream: checkInternetConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || !snapshot.data!) {
            return const ConnectivityWidget();
          }
          return Column(
            children: [
              const CustomSearchFieldForHome(),
              const CustomSizedBoxHeight(0.03),
              PhotoSlider(),
              const CustomSizedBoxHeight(0.02),
              const Row(
                children: [
                  CustomSizedBoxWidth(0.06),
                  AppSemiText(
                    text: 'Nearest workshops',
                    size: 0.05,
                  )
                ],
              ),
              const CustomSizedBoxHeight(0.01),
              Expanded(
                  child: Homescreenlist(
                ratingCounts: ratingCountsFuture,
              )),
            ],
          );
        },
      ),
    );
  }
}
