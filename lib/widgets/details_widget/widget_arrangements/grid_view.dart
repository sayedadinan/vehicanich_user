import 'package:flutter/material.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/screens/booking_screen.dart/booking_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/details_widget/widget_arrangements/custom_text.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

class GridViewArrangeD extends StatelessWidget {
  final List<dynamic> servicelist;
  final BodyMaintainceState state;
  const GridViewArrangeD(
      {super.key, required this.servicelist, required this.state});

  @override
  Widget build(BuildContext context) {
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            servicename: servicelist[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Myappallcolor().textcolor,
                        borderRadius: BorderRadius.circular(12)),
                    width: Mymediaquery().mediaquerywidth(0.01, context),
                    height: Mymediaquery().mediaqueryheight(0.01, context),
                    child: Column(
                      children: [
                        SizedBox(
                            height:
                                Mymediaquery().mediaqueryheight(0.03, context)),
                        SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.05, context),
                          width: Mymediaquery().mediaquerywidth(0.21, context),
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
  }
}
