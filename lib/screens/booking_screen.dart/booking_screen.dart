import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/custom_text.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: const CustomAppbar(
          appbartext: 'Dent Repair and works',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Mymediaquery().mediaqueryheight(0.05, context)),
            const CustomizedText(text: detailspagestatictext),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),

            ///here i want to use that calender
            Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.04, context),
                  right: Mymediaquery().mediaquerywidth(0.04, context)),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  // Handle selected date change here
                },
              ),
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
            const Inputfield(hinttext: 'your vehicle number'),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
            const Inputfield(hinttext: 'your phone number'),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.06, context)),
            Container(
              decoration: BoxDecoration(
                  color: Myappallcolor().detailspageboxcolor,
                  border: Border.all(color: Myappallcolor().colorwhite),
                  borderRadius: BorderRadius.circular(12)),
              width: Mymediaquery().mediaquerywidth(0.78, context),
              height: Mymediaquery().mediaqueryheight(0.21, context),
              child: Column(
                children: [
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        detailscontainerpricetext,
                        style: TextStyle(color: Myappallcolor().colorwhite),
                      )
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        detailscontainerdescriptiontext,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Myappallcolor().colorwhite,
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.03, context)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.06, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
                Text(
                  detailsprise,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Myappallcolor().colorwhite,
                      fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
                Text(
                  detailspricedescription,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Myappallcolor().colorwhite,
                      fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
                )
              ],
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
            CustomButton(
                color: Myappallcolor().buttonforgroundcolor,
                function: () {},
                text: 'Proceed to pay',
                fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                buttontextcolor: Myappallcolor().colorwhite,
                bordercolor: Colors.transparent),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.05, context)),
          ],
        ),
      ),
    );
  }
}
