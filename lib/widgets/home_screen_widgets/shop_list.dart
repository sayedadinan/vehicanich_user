import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';

class Homescreenlist extends StatelessWidget {
  const Homescreenlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: checkInternetConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: loader);
        }
        if (!snapshot.hasData || !snapshot.data!) {
          return const Center(
              child: AppText(text: 'no internet connection', size: 0.04));
        }

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: ShopRepository().getShopDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loader);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No shops available'));
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final shopDetails = snapshot.data![index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Mymediaquery().mediaquerywidth(0.03, context),
                    vertical: Mymediaquery().mediaqueryheight(0.003, context),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShopDetailsPage(
                          shopdetails: shopDetails,
                          tag: shopDetails[Shopkeys.licenceimagepath],
                        ),
                      ));
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
                              width:
                                  Mymediaquery().mediaquerywidth(0.02, context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Mymediaquery()
                                    .mediaqueryheight(0.01, context),
                              ),
                              child: ImageContainer(
                                tag: shopDetails[Shopkeys.licenceimagepath],
                                imagepath:
                                    shopDetails[Shopkeys.bannerimagepath],
                              ),
                            ),
                            SizedBox(
                              width:
                                  Mymediaquery().mediaquerywidth(0.04, context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Mymediaquery()
                                    .mediaqueryheight(0.00, context),
                              ),
                              child: ListtileText(
                                shoplocation:
                                    shopDetails[Shopkeys.locationaddress],
                                shopname: shopDetails[Shopkeys.shopname],
                                phone: shopDetails[Shopkeys.phone],
                                startingtime:
                                    shopDetails[Shopkeys.startingtime],
                                closingtime: shopDetails[Shopkeys.closingtime],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
