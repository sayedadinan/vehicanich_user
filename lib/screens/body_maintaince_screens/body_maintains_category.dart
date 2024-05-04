import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/body_main_service/bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/screens/booking_screen.dart/booking_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/details_widget/custom_text.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

class BodyMaintainceandRepair extends StatelessWidget {
  const BodyMaintainceandRepair({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: const CustomAppbar(
          appbartext: 'Body Maintenance and \n Repair',
        ),
      ),
      body: BlocConsumer<BodyMaintainceBloc, BodyMaintainceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Bodymaintainceloading) {
            return Center(
              child: loader,
            );
          }
          List<String> servicelist = state.servicekeys;
          List<dynamic> rates = state.prices;
          return Column(
            children: [
              SizedBox(height: Mymediaquery().mediaqueryheight(0.05, context)),
              const CustomizedText(
                text: bodypagefirsttext,
              ),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Mymediaquery().mediaquerywidth(0.05, context),
                      right: Mymediaquery().mediaquerywidth(0.05, context)),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 27,
                      mainAxisExtent: 100,
                    ),
                    itemCount: servicelist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(FadeTransitionPageRoute(
                              child: BookingScreen(
                            phonenumber: state.phonenumber,
                            rate: rates[index].toString(),
                            servicename: servicelist[index],
                          )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Myappallcolor().textcolor,
                              borderRadius: BorderRadius.circular(12)),
                          width: Mymediaquery().mediaquerywidth(0.01, context),
                          height:
                              Mymediaquery().mediaqueryheight(0.01, context),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: Mymediaquery()
                                      .mediaqueryheight(0.03, context)),
                              Container(
                                height: Mymediaquery()
                                    .mediaqueryheight(0.05, context),
                                width: Mymediaquery()
                                    .mediaquerywidth(0.21, context),
                                child: Text(servicelist[index].toString()),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
