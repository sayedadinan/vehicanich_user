import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/widgets/home_screen_widgets/shimmer_effect.dart';
import 'package:vehicanich/widgets/rating_widgets/rating_card.dart';

class RatingScreen extends StatelessWidget {
  final String phone;
  const RatingScreen({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Rating and Review',
          size: 0.05,
        ),
        backgroundColor: Myappallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: FutureBuilder<QuerySnapshot?>(
        future: ShopRepository().ratingsAndReview(phone),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              children: [
                CustomSizedBoxHeight(0.03),
                HomeScreenPlaceholder(),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: AppText(text: 'there is no data', size: 0.03));
          } else {
            final ratingDetails = snapshot.data!.docs;
            return ReviewShowingCard(
              bookingDetails: ratingDetails,
            );
          }
        },
      ),
    );
  }
}
