import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/screens/user_bookings/user_bookings.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_googlebutton.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/row_text_arrange.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key, required this.bookings});
  final Map<String, dynamic> bookings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: const CustomAppbar(
          appbartext: 'Booking Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSizedBoxHeight(0.05),
            Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.04, context),
                  right: Mymediaquery().mediaquerywidth(0.04, context)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Myappallcolor().colorwhite,
                    )),
                width: double.infinity,
                height: Mymediaquery().mediaqueryheight(0.17, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBoxHeight(0.02),
                    RowforBookingsInside(
                        valuetext: bookings[ReferenceKeys.servicename],
                        keytext: 'Service Category'),
                    CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: bookings[ReferenceKeys.vehiclenumber],
                        keytext: 'Vehicle Number'),
                    CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: bookings[ReferenceKeys.date],
                        keytext: 'booked date'),
                    CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: bookings[ReferenceKeys.shopphone],
                        keytext: 'shop phone'),
                    CustomSizedBoxHeight(0.001),
                  ],
                ),
              ),
            ),
            CustomSizedBoxHeight(0.02),
            // CustomGoogleButton(
            //     color: Myappallcolor().listcontainer,
            //     function: () {},
            //     text: 'Track your order',
            //     fontSize: Mymediaquery().mediaquerywidth(0.05, context),
            //     buttontextcolor: Myappallcolor().colorwhite,
            //     bordercolor: Colors.transparent),
            // CustomSizedBoxHeight(0.02),
            CustomGoogleButton(
                color: Myappallcolor().listcontainer,
                function: () {
                  context.read<BookingBloc>().add(BookingCancelledPressed(
                      vehicleNumber: bookings[ReferenceKeys.vehiclenumber],
                      serviceName: bookings[ReferenceKeys.servicename],
                      shopId: bookings[ReferenceKeys.shopId]));
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const UserBookingsPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                text: 'Cancel the booking',
                fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                buttontextcolor: Myappallcolor().colorwhite,
                bordercolor: Colors.white),
            const TimeLineOrder(),
          ],
        ),
      ),
    );
  }
}

class TimeLineOrder extends StatelessWidget {
  const TimeLineOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          TimelineTile(
            isFirst: true,
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(
              width: Mymediaquery().mediaquerywidth(0.04, context),
              color: const Color(0xFF27AA69),
              padding: const EdgeInsets.all(6),
            ),
            endChild: const RightChild(
                title: 'car is in waiting',
                message: 'your vehicle is in under checking'),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(
              width: Mymediaquery().mediaquerywidth(0.04, context),
              color: const Color(0xFF27AA69),
              padding: const EdgeInsets.all(6),
            ),
            endChild: const RightChild(
                title: 'work started',
                message: 'we take your vehicle for work'),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(
              width: Mymediaquery().mediaquerywidth(0.04, context),
              color: const Color(0xFF27AA69),
              padding: const EdgeInsets.all(6),
            ),
            endChild: const RightChild(
                title: 'work completed',
                message: 'your vehicle work completed '),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            isLast: true,
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(
              width: Mymediaquery().mediaquerywidth(0.04, context),
              color: Color(0xFFDADADA),
              padding: const EdgeInsets.all(6),
            ),
            endChild: const RightChild(
                title: 'ready to pickup', message: 'pay and pick your car'),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
        ],
      ),
    );
  }
}

class RightChild extends StatelessWidget {
  const RightChild({
    required this.title,
    required this.message,
    this.disabled = true,
  }) : super();

  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
