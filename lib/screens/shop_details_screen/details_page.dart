import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
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
                CustomSizedBoxHeight(0.03),
                ShopTextArrange(
                    longitude: longitude,
                    latitude: latitude,
                    shopname: widget.shopdetails[Shopkeys.shopname]),
                CustomSizedBoxHeight(0.02),
                ShopTimeText(
                    startingtime: widget.shopdetails[Shopkeys.startingtime],
                    closingtime: widget.shopdetails[Shopkeys.closingtime]),
                CustomSizedBoxHeight(0.04),
                Container(
                  width: double.infinity,
                  height: Mymediaquery().mediaqueryheight(1, context),
                  decoration: BoxDecoration(
                      color: Myappallcolor().appbarbackgroundcolor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      CustomSizedBoxHeight(0.03),
                      const RowTexts(text: 'Description'),
                      CustomSizedBoxHeight(0.02),
                      DetailsPageDescription(
                        text: widget.shopdetails[Shopkeys.description],
                      ),
                      CustomSizedBoxHeight(0.02),
                      const DetailsPageCrButton(),
                      CustomSizedBoxHeight(0.02),
                      Padding(
                          padding: EdgeInsets.only(
                              left: Mymediaquery()
                                  .mediaquerywidth(0.05, context)),
                          child: DetailsPageRow(
                              shopdetails: widget.shopdetails,
                              shopPhone: widget.shopdetails[Shopkeys.phone])),
                      CustomSizedBoxHeight(0.02),
                      const RowTexts(text: 'for emergency'),
                      CustomSizedBoxHeight(0.02),
                      CustomButton(
                          bordercolor: Myappallcolor().buttonforgroundcolor,
                          color: Myappallcolor().emergencybuttoncolor,
                          function: () {},
                          text: 'Emergency service',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          buttontextcolor: Myappallcolor().colorwhite),
                      CustomSizedBoxHeight(0.02),
                      const RowTexts(text: 'Our services'),
                      CustomSizedBoxHeight(0.02),
                      buildServiceButton(
                          'Body Maintaince and Repair',
                          Shopkeys.bodyservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
                      CustomSizedBoxHeight(0.02),
                      buildServiceButton(
                          'Interior Services',
                          Shopkeys.interiorservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
                      CustomSizedBoxHeight(0.02),
                      buildServiceButton(
                          'Engine and Mechanical Services',
                          Shopkeys.enginservicemap,
                          context,
                          widget.shopdetails[Shopkeys.phone]),
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
