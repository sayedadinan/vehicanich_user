import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vehicanich/blocs/rating_and_review/bloc/ratings_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/constants/text_controller.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class RatingDialog extends StatelessWidget {
  final bookings;

  const RatingDialog({super.key, required this.bookings});
  @override
  Widget build(BuildContext context) {
    double ratingCount = 0;
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
                ratingController = rating;
                log(ratingCount.toString());
              },
            ),
            const CustomSizedBoxHeight(0.02),
            SizedBox(
                height: Mymediaquery().mediaqueryheight(0.05, context),
                width: Mymediaquery().mediaquerywidth(0.74, context),
                child: Inputfield(
                  controller: feedbackController,
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
                  function: () {
                    context.read<RatingsBloc>().add(RatingAndReviewAdding(
                        feedback: feedbackController.text,
                        ratingCount: ratingController.toString(),
                        shopId: bookings[ReferenceKeys.shopId]));
                    feedbackController.clear();
                    Navigator.of(context).pop();
                  },
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
