import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/widget_arrangements/grid_view.dart';

class ServiceDetails extends StatelessWidget {
  final String textforappbar;
  const ServiceDetails({super.key, required this.textforappbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: CustomAppbar(appbartext: textforappbar),
      ),
      body: BlocConsumer<BodyMaintainceBloc, BodyMaintainceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Bodymaintainceloading) {
            return Center(child: loader);
          }
          List<dynamic> servicelist = state.services;
          return GridViewArrangeD(servicelist: servicelist, state: state);
        },
      ),
    );
  }
}
