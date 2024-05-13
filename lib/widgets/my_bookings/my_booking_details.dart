import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Column(
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
          CustomGoogleButton(
              color: Myappallcolor().listcontainer,
              function: () {},
              text: 'Track your order',
              fontSize: Mymediaquery().mediaquerywidth(0.05, context),
              buttontextcolor: Myappallcolor().colorwhite,
              bordercolor: Colors.transparent),
          CustomSizedBoxHeight(0.02),
          CustomGoogleButton(
              color: Colors.transparent,
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
        ],
      ),
    );
  }
}
