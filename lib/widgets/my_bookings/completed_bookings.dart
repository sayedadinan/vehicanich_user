import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/booking_card.dart';

class CompletedBookings extends StatelessWidget {
  const CompletedBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Myappallcolor().appbackgroundcolor,
      child: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
        future: UserRepository().userCompletedBooking(),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Return the dialog widget
                            return RatingDialog();
                          },
                        );
                      },
                      child: My_booking_card(
                        bookings: bookings,
                      ),
                    ),
                  );
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

class RatingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Myappallcolor().bookingCardColor,
      children: [
        Column(
          children: [
            const AppText(text: 'Give Feedback', size: 0.04),
            const CustomSizedBoxHeight(0.005),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.63, context),
              child: const AppText(
                  text: 'how is your experience with our service?', size: 0.03),
            ),
            const CustomSizedBoxHeight(0.02),
            RatingBar.builder(
              initialRating: 0,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
                return const SizedBox();
              },
              onRatingUpdate: (rating) {
                log(rating.toString());
              },
            ),
            const CustomSizedBoxHeight(0.02),
            SizedBox(
                height: Mymediaquery().mediaqueryheight(0.05, context),
                width: Mymediaquery().mediaquerywidth(0.74, context),
                child: Inputfield(
                  hinttext: 'Mention a reasons for your rating',
                ))
          ],
        ),
        CustomSizedBoxHeight(0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.04, context),
              width: Mymediaquery().mediaquerywidth(0.22, context),
              child: CustomButton(
                  color: Myappallcolor().buttonforgroundcolor,
                  function: () {},
                  text: 'Submit',
                  fontSize: Mymediaquery().mediaquerywidth(0.03, context),
                  buttontextcolor: Myappallcolor().colorwhite,
                  bordercolor: Colors.transparent),
            ),
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.04, context),
              width: Mymediaquery().mediaquerywidth(0.22, context),
              child: CustomButton(
                  color: Myappallcolor().textcolor,
                  function: () {},
                  text: 'Cancel',
                  fontSize: Mymediaquery().mediaquerywidth(0.03, context),
                  buttontextcolor: Myappallcolor().colorwhite,
                  bordercolor: Colors.transparent),
            ),
          ],
        ),
      ],
    );
  }
}
