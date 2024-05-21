import 'package:flutter/material.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/row_text_arrange.dart';

class My_booking_card extends StatelessWidget {
  const My_booking_card({
    super.key,
    required this.bookings,
  });

  final Map<String, dynamic> bookings;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Myappallcolor().appbackgroundcolor,
      child: SizedBox(
        height: Mymediaquery().mediaqueryheight(0.12, context),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.05, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBoxHeight(0.02),
                  Rowforcontainer(
                      valuetext: bookings[ReferenceKeys.servicename],
                      keytext: 'Service Category'),
                  Rowforcontainer(
                      valuetext: bookings[ReferenceKeys.vehiclenumber],
                      keytext: 'Vehicle Number'),
                  Rowforcontainer(
                      valuetext: bookings[ReferenceKeys.date],
                      keytext: 'booked date'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
