import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/screens/body_maintaince_screens/body_maintains_category.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_slide_transition.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_details_iconrow.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_details_textarrangement.dart';
import 'package:vehicanich/widgets/shop_details_widget/shop_image_container.dart';

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
    return BlocConsumer<BodyMaintainceBloc, BodyMaintainceState>(
      listener: (context, state) {
        if (state is BodyMaintaincebuttonNavigation) {
          Navigator.of(context).push(SlideTransitionPageRoute(
              child: const ServiceDetails(
            textforappbar: 'Body Maintaince and \n Repair',
          )));
        }
        if (state is InteriorServiceeButtonNavigation) {
          Navigator.of(context).push(SlideTransitionPageRoute(
              child: const ServiceDetails(
            textforappbar: '       Interior Services',
          )));
        }
        if (state is EngineServiceeButtonNavigation) {
          Navigator.of(context).push(SlideTransitionPageRoute(
              child: const ServiceDetails(
            textforappbar: 'Engine and Mechanical Services',
          )));
        }
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
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context)),
                ShopTextArrange(
                  shopname: widget.shopdetails[Shopkeys.shopname],
                ),
                SizedBox(
                  height: Mymediaquery().mediaqueryheight(0.02, context),
                ),
                ShopTimeText(
                  startingtime: widget.shopdetails[Shopkeys.startingtime],
                  closingtime: widget.shopdetails[Shopkeys.closingtime],
                ),
                SizedBox(
                  height: Mymediaquery().mediaqueryheight(0.04, context),
                ),
                Container(
                  width: double.infinity,
                  height: Mymediaquery().mediaqueryheight(1, context),
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
                          height:
                              Mymediaquery().mediaqueryheight(0.03, context)),
                      Row(
                        children: [
                          SizedBox(
                              width: Mymediaquery()
                                  .mediaquerywidth(0.10, context)),
                          const DetailsPageTitleText(titletext: 'Description')
                        ],
                      ),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      const DetailsPageDescription(),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      const DetailsPageCrButton(),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                Mymediaquery().mediaquerywidth(0.05, context)),
                        child: DetailsPageRow(
                          shopPhone: widget.shopdetails[Shopkeys.phone],
                        ),
                      ),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      Row(
                        children: [
                          SizedBox(
                            width:
                                Mymediaquery().mediaquerywidth(0.10, context),
                          ),
                          const DetailsPageTitleText(
                              titletext: 'for emergency'),
                        ],
                      ),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      CustomButton(
                          bordercolor: Myappallcolor().buttonforgroundcolor,
                          color: Myappallcolor().emergencybuttoncolor,
                          function: () {},
                          text: 'Emergency service',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          buttontextcolor: Myappallcolor().colorwhite),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      Row(
                        children: [
                          SizedBox(
                            width:
                                Mymediaquery().mediaquerywidth(0.10, context),
                          ),
                          const DetailsPageTitleText(titletext: 'Our services'),
                        ],
                      ),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      CustomButton(
                          bordercolor: Myappallcolor().colorwhite,
                          color: Colors.transparent,
                          function: () {
                            context.read<BodyMaintainceBloc>().add(
                                BodyMaintainceButtonPressed(
                                    servicemapkey: Shopkeys.bodyservicemap,
                                    shopphone:
                                        widget.shopdetails[Shopkeys.phone]));
                          },
                          text: 'Body Maintaince and Repair',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          buttontextcolor: Myappallcolor().colorwhite),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      CustomButton(
                          bordercolor: Myappallcolor().colorwhite,
                          color: Colors.transparent,
                          function: () {
                            context.read<BodyMaintainceBloc>().add(
                                InteriorButtonPressed(
                                    servicemapkey: Shopkeys.interiorservicemap,
                                    shopphone:
                                        widget.shopdetails[Shopkeys.phone]));
                          },
                          text: 'Interior Services',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          buttontextcolor: Myappallcolor().colorwhite),
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      CustomButton(
                          bordercolor: Myappallcolor().colorwhite,
                          color: Colors.transparent,
                          function: () {
                            context.read<BodyMaintainceBloc>().add(
                                EngineServiceButtonPressed(
                                    servicemapkey: Shopkeys.enginservicemap,
                                    shopphone:
                                        widget.shopdetails[Shopkeys.phone]));
                          },
                          text: 'Engine and Mechanical Services',
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          buttontextcolor: Myappallcolor().colorwhite),
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
