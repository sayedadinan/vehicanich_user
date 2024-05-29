import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/screens/shop_ratings_showing/rating_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich/widgets/shop_details_widget/funtions/buttons.dart';
import 'package:vehicanich/widgets/shop_details_widget/funtions/navigation_logic.dart';
import 'package:vehicanich/widgets/shop_details_widget/widget_arrangement/row_text.dart';
import 'package:vehicanich/widgets/shop_details_widget/widget_arrangement/shop_details_iconrow.dart';
import 'package:vehicanich/widgets/shop_details_widget/widget_arrangement/shop_details_textarrangement.dart';
import 'package:vehicanich/widgets/shop_details_widget/widget_arrangement/shop_image_container.dart';

class ShopDetailsPage extends StatefulWidget {
  final String tag;
  final Map<String, dynamic> shopdetails;
  const ShopDetailsPage(
      {super.key, required this.tag, required this.shopdetails});

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ChatingBloc>()
        .add(FetchShopId(shopPhone: widget.shopdetails[Shopkeys.phone]));
  }

  @override
  Widget build(BuildContext context) {
    double latitude = widget.shopdetails[Shopkeys.shoplocation].latitude;
    double longitude = widget.shopdetails[Shopkeys.shoplocation].longitude;
    return BlocConsumer<BodyMaintainceBloc, BodyMaintainceState>(
      listener: (context, state) {
        navigateBasedOnState(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Myappallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ShopDetailImage(
                    tag: widget.tag,
                    imagepath: widget.shopdetails[Shopkeys.bannerimagepath]),
                const CustomSizedBoxHeight(0.03),
                ShopTextArrange(
                    longitude: longitude,
                    latitude: latitude,
                    shopname: widget.shopdetails[Shopkeys.shopname]),
                const CustomSizedBoxHeight(0.02),
                ShopTimeText(
                    startingtime: widget.shopdetails[Shopkeys.startingtime],
                    closingtime: widget.shopdetails[Shopkeys.closingtime]),
                const CustomSizedBoxHeight(0.04),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Myappallcolor().appbarbackgroundcolor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      const CustomSizedBoxHeight(0.03),
                      const RowTexts(text: 'Description'),
                      const CustomSizedBoxHeight(0.02),
                      DetailsPageDescription(
                        text: widget.shopdetails[Shopkeys.description],
                      ),
                      const CustomSizedBoxHeight(0.02),
                      // DetailsPageCrButton(
                      //   shopPhone: widget.shopdetails[Shopkeys.phone],
                      // ),
                      const CustomSizedBoxHeight(0.02),
                      Padding(
                          padding: EdgeInsets.only(
                              left: Mymediaquery()
                                  .mediaquerywidth(0.05, context)),
                          child: DetailsPageRow(
                              shopdetails: widget.shopdetails,
                              shopPhone: widget.shopdetails[Shopkeys.phone])),
                      const CustomSizedBoxHeight(0.02),
                      const RowTexts(text: 'Our feedbacks'),
                      const CustomSizedBoxHeight(0.02),
                      CustomButton(
                          bordercolor: Myappallcolor().buttonforgroundcolor,
                          color: Myappallcolor().textcolor,
                          function: () {
                            Navigator.of(context).push(FadeTransitionPageRoute(
                                child: RatingScreen(
                              phone: widget.shopdetails[Shopkeys.phone],
                            )));
                          },
                          text: 'What Clients Say',
                          fontSize: 0.04,
                          buttontextcolor: Colors.black),
                      const CustomSizedBoxHeight(0.02),
                      const RowTexts(text: 'Our services'),
                      const CustomSizedBoxHeight(0.02),
                      buildServiceButtonBody(
                          'Body Maintaince and Repair',
                          Shopkeys.bodyservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
                      const CustomSizedBoxHeight(0.02),
                      buildServiceButtonInterior(
                          'Interior Services',
                          Shopkeys.interiorservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
                      const CustomSizedBoxHeight(0.02),
                      buildServiceButtonEngine(
                          'Engine and Mechanical Services',
                          Shopkeys.enginservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
                      const CustomSizedBoxHeight(0.04),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
