import 'package:flutter/material.dart';
import 'package:vehicanich/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_details_iconrow.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_details_textarrangement.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_image_container.dart';

class ShopDetailsPage extends StatelessWidget {
  final String tag;
  final Map<String, dynamic> shopdetails;
  const ShopDetailsPage(
      {Key? key, required this.tag, required this.shopdetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShopDetailImage(
              tag: tag,
              imagepath: shopdetails[Shopkeys().bannerimagepath],
            ),
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.03, context),
            ),
            ShopTextArrange(
              shopname: shopdetails[Shopkeys().shopname],
            ),
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.02, context),
            ),
            ShopTimeText(
              startingtime: shopdetails[Shopkeys().startingtime],
              closingtime: shopdetails[Shopkeys().closingtime],
            ),
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.04, context),
            ),
            Container(
              width: double.infinity,
              height: Mymediaquery().mediaqueryheight(0.95, context),
              decoration: BoxDecoration(
                color: Myappallcolor().appbarbackgroundcolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  Row(
                    children: [
                      SizedBox(
                          width: Mymediaquery().mediaquerywidth(0.04, context)),
                      const DetailsPageTitleText(titletext: 'Description')
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  const DetailsPageDescription(),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  const DetailsPageCrButton(),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  const DetailsPageRow(),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  Row(
                    children: [
                      SizedBox(
                        width: Mymediaquery().mediaquerywidth(0.04, context),
                      ),
                      const DetailsPageTitleText(titletext: 'for emergency'),
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  CustomButton(
                      bordercolor: Myappallcolor().buttonforgroundcolor,
                      color: Myappallcolor().emergencybuttoncolor,
                      function: () {},
                      text: 'SOS',
                      fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                      buttontextcolor: Myappallcolor().colorwhite),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  Row(
                    children: [
                      SizedBox(
                        width: Mymediaquery().mediaquerywidth(0.04, context),
                      ),
                      const DetailsPageTitleText(titletext: 'Our services'),
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  CustomButton(
                      bordercolor: Myappallcolor().colorwhite,
                      color: Colors.transparent,
                      function: () {},
                      text: 'Body Maintaince and Repair',
                      fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                      buttontextcolor: Myappallcolor().colorwhite),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  CustomButton(
                      bordercolor: Myappallcolor().colorwhite,
                      color: Colors.transparent,
                      function: () {},
                      text: 'Interior Services',
                      fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                      buttontextcolor: Myappallcolor().colorwhite),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  CustomButton(
                      bordercolor: Myappallcolor().colorwhite,
                      color: Colors.transparent,
                      function: () {},
                      text: 'Engine and Mechanical Services',
                      fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                      buttontextcolor: Myappallcolor().colorwhite),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
