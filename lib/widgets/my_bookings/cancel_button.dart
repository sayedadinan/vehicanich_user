import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/screens/user_bookings/user_bookings.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_googlebutton.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/my_booking_details.dart';

class Cancel_button extends StatelessWidget {
  const Cancel_button({
    super.key,
    required this.widget,
  });

  final BookingDetails widget;

  @override
  Widget build(BuildContext context) {
    return CustomGoogleButton(
        color: Myappallcolor().listcontainer,
        function: () {
          context.read<BookingBloc>().add(BookingCancelledPressed(
              vehicleNumber: widget.bookings[ReferenceKeys.vehiclenumber],
              serviceName: widget.bookings[ReferenceKeys.servicename],
              shopId: widget.bookings[ReferenceKeys.shopId]));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const UserBookingsPage()),
            (Route<dynamic> route) => false,
          );
        },
        text: 'Cancel the booking',
        fontSize: Mymediaquery().mediaquerywidth(0.05, context),
        buttontextcolor: Myappallcolor().colorwhite,
        bordercolor: Colors.white);
  }
}
