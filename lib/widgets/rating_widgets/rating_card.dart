import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ReviewShowingCard extends StatelessWidget {
  const ReviewShowingCard({
    super.key,
    required this.bookingDetails,
  });

  final List<QueryDocumentSnapshot<Object?>> bookingDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookingDetails.length,
      itemBuilder: (context, index) {
        final bookingDetail = bookingDetails[index];
        final starCount =
            double.parse(bookingDetail[ReferenceKeys.ratingCount]);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Myappallcolor().appbarbackgroundcolor,
            child: SizedBox(
              width: Mymediaquery().mediaquerywidth(0.20, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxHeight(0.01),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context)),
                    child: AppText(
                      text: bookingDetail[ReferenceKeys.userName],
                      size: 0.03,
                    ),
                  ),
                  CustomSizedBoxHeight(0.008),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.04, context)),
                    child: RatingBar.builder(
                      itemSize: Mymediaquery().mediaquerywidth(0.03, context),
                      initialRating: starCount,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                        log(rating.toString());
                      },
                    ),
                  ),
                  const CustomSizedBoxHeight(0.01),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context)),
                    child: SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.80, context),
                      child: AppText(
                          size: 0.03,
                          text: bookingDetail[ReferenceKeys.feedback]),
                    ),
                  ),
                  const CustomSizedBoxHeight(0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
