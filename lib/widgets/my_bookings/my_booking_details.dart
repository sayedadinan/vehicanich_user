import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/screens/total_payment_screen/total_bill_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_googlebutton.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/my_bookings/row_text_arrange.dart';
import 'package:vehicanich/widgets/my_bookings/time_line_order.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key, required this.bookings});
  final Map<String, dynamic> bookings;

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  void initState() {
    log('worked');
    super.initState();
    context.read<BookingBloc>().add(CurrentStatus(
        shopId: widget.bookings[ReferenceKeys.shopId],
        serviceName: widget.bookings[ReferenceKeys.servicename],
        vehicleNumber: widget.bookings[ReferenceKeys.vehiclenumber]));
  }

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
            const CustomSizedBoxHeight(0.05),
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
                    const CustomSizedBoxHeight(0.02),
                    RowforBookingsInside(
                        valuetext: widget.bookings[ReferenceKeys.servicename],
                        keytext: 'Service Category'),
                    const CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: widget.bookings[ReferenceKeys.vehiclenumber],
                        keytext: 'Vehicle Number'),
                    const CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: widget.bookings[ReferenceKeys.date],
                        keytext: 'booked date'),
                    const CustomSizedBoxHeight(0.001),
                    RowforBookingsInside(
                        valuetext: widget.bookings[ReferenceKeys.shopphone],
                        keytext: 'shop phone'),
                    const CustomSizedBoxHeight(0.001),
                  ],
                ),
              ),
            ),
            const CustomSizedBoxHeight(0.02),
            TimeLineOrder(
              widget: widget,
            ),
            BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                if (state.isCompleted) {
                  return CustomGoogleButton(
                    bordercolor: Myappallcolor().colorwhite,
                    buttontextcolor: Myappallcolor().colorwhite,
                    color: Colors.transparent,
                    fontSize: Mymediaquery().mediaquerywidth(0.03, context),
                    function: () {
                      Navigator.of(context).push(FadeTransitionPageRoute(
                          child: TotalBillScreen(
                        bookings: widget.bookings,
                      )));
                    },
                    text: 'Total bill',
                  );
                } else {
                  return Container();
                }
              },
            ),
            const CustomSizedBoxHeight(0.13)
          ],
        ),
      ),
    );
  }
}
