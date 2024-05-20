import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/widgets/my_bookings/pending_bookings/booking_paddings.dart';

class PendingBookingTab extends StatelessWidget {
  const PendingBookingTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Myappallcolor().appbackgroundcolor,
      child: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
        future: UserRepository().userMybookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loader;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final bookingData = snapshot.data;
            if (bookingData != null && bookingData.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final bookings = snapshot.data![index];
                  return PaddingsOfBookingCard(bookings: bookings);
                },
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    const CustomSizedBoxHeight(0.06),
                    Image.asset('assets/images/urban-967.png'),
                    const AppText(text: 'No bookings available', size: 0.07)
                  ],
                ),
              );
            }
          }
        },
      )),
    );
  }
}
