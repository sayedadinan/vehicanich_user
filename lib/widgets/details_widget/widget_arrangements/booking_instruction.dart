import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

class BookingInstructions extends StatelessWidget {
  const BookingInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Myappallcolor().detailspageboxcolor,
          border: Border.all(color: Myappallcolor().colorwhite),
          borderRadius: BorderRadius.circular(12)),
      width: Mymediaquery().mediaquerywidth(0.78, context),
      height: Mymediaquery().mediaqueryheight(0.21, context),
      child: Column(
        children: [
          SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                detailscontainerpricetext,
                style: TextStyle(color: Myappallcolor().colorwhite),
              )
            ],
          ),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSemiText(
                text: detailscontainerdescriptiontext, size: 0.03,
                // style: TextStyle(color: Myappallcolor().colorwhite),
              )
            ],
          ),
        ],
      ),
    );
  }
}
