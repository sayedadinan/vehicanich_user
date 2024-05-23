import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';
import 'package:vehicanich/widgets/home_screen_widgets/photo_slider_widget.dart';
import 'package:vehicanich/widgets/search_widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '   VEHICANICH',
                style: TextStyle(
                    color: Myappallcolor().colorwhite,
                    fontSize: Mymediaquery().mediaquerywidth(0.06, context)),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.0,
        ),
        backgroundColor: Myappallcolor().appbackgroundcolor,
        body: Column(
          children: [
            const CustomSearchFieldForHome(),
            const CustomSizedBoxHeight(0.04),
            PhotoSlider(),
            const CustomSizedBoxHeight(0.02),
            Text(
              'your preffered work shops',
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaquerywidth(0.05, context)),
            ),
            const Homescreenlist(),
          ],
        ));
  }
}

class Homescreenlist extends StatelessWidget {
  const Homescreenlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: ShopRepository().getShopDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final shopDetails = snapshot.data![index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: Mymediaquery().mediaquerywidth(0.03, context),
                    right: Mymediaquery().mediaquerywidth(0.03, context),
                    top: Mymediaquery().mediaqueryheight(0.01, context),
                    bottom: Mymediaquery().mediaqueryheight(0.00, context),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShopDetailsPage(
                                shopdetails: shopDetails,
                                tag: shopDetails[Shopkeys.licenceimagepath],
                              )));
                    },
                    child: Card(
                      elevation: 20,
                      color: Myappallcolor().appbackgroundcolor,
                      child: SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.12, context),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: Mymediaquery()
                                    .mediaquerywidth(0.02, context)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: Mymediaquery()
                                        .mediaqueryheight(0.01, context)),
                                child: ImageContainer(
                                    tag: shopDetails[Shopkeys.licenceimagepath],
                                    imagepath:
                                        shopDetails[Shopkeys.bannerimagepath])),
                            SizedBox(
                                width: Mymediaquery()
                                    .mediaquerywidth(0.04, context)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Mymediaquery()
                                      .mediaqueryheight(0.01, context)),
                              child: ListtileText(
                                shoplocation:
                                    shopDetails[Shopkeys.locationaddress],
                                shopname: shopDetails[Shopkeys.shopname],
                                phone: shopDetails[Shopkeys.phone],
                                startingtime:
                                    shopDetails[Shopkeys.startingtime],
                                closingtime: shopDetails[Shopkeys.closingtime],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
