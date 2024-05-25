import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';
import 'package:vehicanich/widgets/home_screen_widgets/shimmer_effect.dart';

class Homescreenlist extends StatelessWidget {
  final Future<Map<dynamic, dynamic>>? ratingCounts;
  const Homescreenlist({
    super.key,
    required this.ratingCounts,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: checkInternetConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeScreenPlaceholder();
          }
          if (!snapshot.hasData || !snapshot.data!) {
            return const Center(
                child: AppText(text: 'no internet connection', size: 0.04));
          }
          return FutureBuilder<Map<dynamic, dynamic>>(
            future: ratingCounts,
            builder: (context, ratingSnapshot) {
              if (ratingSnapshot.connectionState == ConnectionState.waiting) {
                return const HomeScreenPlaceholder();
              } else if (ratingSnapshot.hasError) {
                return Center(
                    child: Text(
                  'Error: ${ratingSnapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ));
              } else if (!ratingSnapshot.hasData ||
                  ratingSnapshot.data!.isEmpty) {
                return const Center(
                    child: AppText(text: 'no ratings available', size: 0.03));
              }
              final ratings = ratingSnapshot.data!;
              return FutureBuilder<List<Map<String, dynamic>>>(
                future: ShopRepository().getShopDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const HomeScreenPlaceholder();
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
                      final shopId = shopDetails['id'];
                      final totalRatingCount = ratings[shopId] ?? 0;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Mymediaquery().mediaquerywidth(0.03, context),
                          vertical:
                              Mymediaquery().mediaqueryheight(0.003, context),
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Mymediaquery()
                                        .mediaquerywidth(0.02, context),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Mymediaquery()
                                          .mediaqueryheight(0.01, context),
                                    ),
                                    child: ImageContainer(
                                      tag: shopDetails[
                                          Shopkeys.licenceimagepath],
                                      imagepath:
                                          shopDetails[Shopkeys.bannerimagepath],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Mymediaquery()
                                        .mediaquerywidth(0.04, context),
                                  ),
                                  ListtileText(
                                      shoplocation:
                                          shopDetails[Shopkeys.locationaddress],
                                      shopname: shopDetails[Shopkeys.shopname],
                                      phone: shopDetails[Shopkeys.phone],
                                      startingtime:
                                          shopDetails[Shopkeys.startingtime],
                                      closingtime:
                                          shopDetails[Shopkeys.closingtime]),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: Mymediaquery()
                                            .mediaqueryheight(0.009, context)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Myappallcolor().colorwhite,
                                            ),
                                            height: Mymediaquery()
                                                .mediaqueryheight(
                                                    0.02, context),
                                            width: Mymediaquery()
                                                .mediaquerywidth(0.06, context),
                                            child: Center(
                                                child: Text(
                                              totalRatingCount.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                      ],
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
        });
  }
}
