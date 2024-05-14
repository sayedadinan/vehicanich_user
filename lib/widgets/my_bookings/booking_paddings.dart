import 'package:flutter/material.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/my_bookings/booking_card.dart';
import 'package:vehicanich/widgets/my_bookings/my_booking_details.dart';

class PaddingsOfBookingCard extends StatelessWidget {
  const PaddingsOfBookingCard({
    super.key,
    required this.bookings,
  });

  final Map<String, dynamic> bookings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Mymediaquery().mediaquerywidth(0.03, context),
        right: Mymediaquery().mediaquerywidth(0.03, context),
        top: Mymediaquery().mediaqueryheight(0.01, context),
        bottom: Mymediaquery().mediaqueryheight(0.00, context),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(FadeTransitionPageRoute(
                child: BookingDetails(
              bookings: bookings,
            )));
          },
          child: My_booking_card(bookings: bookings)),
    );
  }
}
