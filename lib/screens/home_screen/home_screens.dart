import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
// import 'package:vehicanich/screens/login_screen/login_screen.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.103, context)),
        child: const CustomAppbar(
          appbartext: '',
        ),
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
