import 'package:flutter/material.dart';

import 'package:vehicanich/data/services/details_services/map_view.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ShopTextArrange extends StatelessWidget {
  final String shopname;
  final double longitude;
  final double latitude;
  const ShopTextArrange(
      {super.key,
      required this.shopname,
      required this.longitude,
      required this.latitude});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppText(
          text: shopname,
          size: 0.07,
          weight: FontWeight.w700,
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.05, context),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Myappallcolor().colorwhite,
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.02, context),
            ),
            GestureDetector(
              onTap: () {
                MapViews().launchMap(latitude, longitude);
              },
              child: const AppText(
                text: 'view shop',
                size: 0.05,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ShopTimeText extends StatelessWidget {
  final String startingtime;
  final String closingtime;
  const ShopTimeText(
      {super.key, required this.startingtime, required this.closingtime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Mymediaquery().mediaquerywidth(0.7, context),
      height: Mymediaquery().mediaqueryheight(0.03, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Myappallcolor().appbarbackgroundcolor)),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.02, context),
            ),
            const AppText(text: 'Working time', size: 0.04),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.03, context),
            ),
            AppText(
              text: startingtime,
              size: 0.04,
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.01, context),
            ),
            AppText(
              text: 'to',
              size: 0.04,
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.01, context),
            ),
            AppText(
              text: closingtime,
              size: 0.04,
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailsPageCrButton extends StatelessWidget {
//   final String shopPhone;
//   const DetailsPageCrButton({super.key, required this.shopPhone});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: Mymediaquery().mediaquerywidth(0.10, context),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(FadeTransitionPageRoute(
//                 child: RatingScreen(
//               phone: shopPhone,
//             )));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Myappallcolor().colorwhite),
//                 borderRadius: BorderRadius.circular(8)),
//             width: Mymediaquery().mediaqueryheight(0.12, context),
//             // height: Mymediaquery().mediaqueryheight(0.02, context),
//             child: const Center(
//                 child: AppText(text: 'Review and Rating', size: 0.03)),
//           ),
//         ),
//       ],
//     );
//   }
// }

class DetailsPageDescription extends StatelessWidget {
  final String text;
  const DetailsPageDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Mymediaquery().mediaquerywidth(0.8, context),
        child: AppText(text: text, size: 0.04));
  }
}

class DetailsPageTitleText extends StatelessWidget {
  final String titletext;
  const DetailsPageTitleText({super.key, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: titletext,
      size: 0.06,
      weight: FontWeight.w400,
    );
  }
}
