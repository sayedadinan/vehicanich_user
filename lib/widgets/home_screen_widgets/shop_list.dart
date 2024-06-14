import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/funtion/nearest_location.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';
import 'package:vehicanich/widgets/home_screen_widgets/shimmer_effect.dart';

// class Homescreenlist extends StatelessWidget {
//   final Future<Map<dynamic, dynamic>>? ratingCounts;

//   const Homescreenlist({
//     Key? key,
//     required this.ratingCounts,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<bool>(
//       stream: checkInternetConnection(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const HomeScreenPlaceholder();
//         }
//         if (!snapshot.hasData || !snapshot.data!) {
//           return const Center(
//               child: AppText(text: 'No internet connection', size: 0.04));
//         }

//         return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
//           future: fetchNearestShops(context),
//           builder: (context, nearestShopsSnapshot) {
//             if (nearestShopsSnapshot.connectionState ==
//                 ConnectionState.waiting) {
//               return const HomeScreenPlaceholder();
//             } else if (nearestShopsSnapshot.hasError) {
//               return Center(
//                   child: Text('Error: ${nearestShopsSnapshot.error}'));
//             } else if (!nearestShopsSnapshot.hasData ||
//                 nearestShopsSnapshot.data!.isEmpty) {
//               return const Center(child: Text('No nearby shops available'));
//             }

//             final nearestShops = nearestShopsSnapshot.data!;
//             return FutureBuilder<Map<dynamic, dynamic>>(
//               future: ratingCounts,
//               builder: (context, ratingSnapshot) {
//                 if (ratingSnapshot.connectionState == ConnectionState.waiting) {
//                   return const HomeScreenPlaceholder();
//                 } else if (ratingSnapshot.hasError) {
//                   return Center(
//                       child: Text(
//                     'Error: ${ratingSnapshot.error}',
//                     style: const TextStyle(color: Colors.white),
//                   ));
//                 } else if (!ratingSnapshot.hasData ||
//                     ratingSnapshot.data!.isEmpty) {
//                   return const Center(
//                       child: AppText(text: 'No ratings available', size: 0.03));
//                 }

//                 final ratings = ratingSnapshot.data!;
//                 return ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: nearestShops.length,
//                   itemBuilder: (context, index) {
//                     final shopDetails =
//                         nearestShops[index].data() as Map<String, dynamic>;
//                     final shopId = shopDetails['id'];
//                     final totalRatingCount = ratings[shopId] ?? 0;
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal:
//                             Mymediaquery().mediaquerywidth(0.03, context),
//                         vertical:
//                             Mymediaquery().mediaqueryheight(0.003, context),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ShopDetailsPage(
//                               shopdetails: shopDetails,
//                               tag: shopDetails[Shopkeys.licenceimagepath],
//                             ),
//                           ));
//                         },
//                         child: Card(
//                           elevation: 20,
//                           color: Myappallcolor().appbackgroundcolor,
//                           child: SizedBox(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: Mymediaquery()
//                                       .mediaquerywidth(0.02, context),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: Mymediaquery()
//                                         .mediaqueryheight(0.01, context),
//                                   ),
//                                   child: ImageContainer(
//                                     tag: shopDetails[Shopkeys.licenceimagepath],
//                                     imagepath:
//                                         shopDetails[Shopkeys.bannerimagepath],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: Mymediaquery()
//                                       .mediaquerywidth(0.04, context),
//                                 ),
//                                 ListtileText(
//                                     shoplocation:
//                                         shopDetails[Shopkeys.locationaddress],
//                                     shopname: shopDetails[Shopkeys.shopname],
//                                     phone: shopDetails[Shopkeys.phone],
//                                     startingtime:
//                                         shopDetails[Shopkeys.startingtime],
//                                     closingtime:
//                                         shopDetails[Shopkeys.closingtime]),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: Mymediaquery()
//                                           .mediaqueryheight(0.009, context)),
//                                   child: Column(
//                                     children: [
//                                       const Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                         size: 20,
//                                       ),
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             color: Myappallcolor().colorwhite,
//                                           ),
//                                           height: Mymediaquery()
//                                               .mediaqueryheight(0.02, context),
//                                           width: Mymediaquery()
//                                               .mediaquerywidth(0.07, context),
//                                           child: Center(
//                                               child: Text(
//                                             totalRatingCount.toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.w600),
//                                           ))),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
// class Homescreenlist extends StatelessWidget {
//   final Future<Map<dynamic, dynamic>>? ratingCounts;

//   const Homescreenlist({
//     Key? key,
//     required this.ratingCounts,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<bool>(
//       stream: checkInternetConnection(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const HomeScreenPlaceholder();
//         }
//         if (!snapshot.hasData || !snapshot.data!) {
//           return const Center(
//               child: AppText(text: 'No internet connection', size: 0.04));
//         }

//         return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
//           future: fetchNearestShops(context),
//           builder: (context, nearestShopsSnapshot) {
//             if (nearestShopsSnapshot.connectionState ==
//                 ConnectionState.waiting) {
//               return const HomeScreenPlaceholder();
//             } else if (nearestShopsSnapshot.hasError) {
//               return Center(
//                   child: Text('Error: ${nearestShopsSnapshot.error}'));
//             } else if (!nearestShopsSnapshot.hasData ||
//                 nearestShopsSnapshot.data!.isEmpty) {
//               return const Center(child: Text('No nearby shops available'));
//             }

//             final nearestShops = nearestShopsSnapshot.data!;
//             return FutureBuilder<Map<dynamic, dynamic>>(
//               future: ratingCounts,
//               builder: (context, ratingSnapshot) {
//                 if (ratingSnapshot.connectionState == ConnectionState.waiting) {
//                   return const HomeScreenPlaceholder();
//                 } else if (ratingSnapshot.hasError) {
//                   return Center(
//                       child: Text(
//                     'Error: ${ratingSnapshot.error}',
//                     style: const TextStyle(color: Colors.white),
//                   ));
//                 } else if (!ratingSnapshot.hasData ||
//                     ratingSnapshot.data!.isEmpty) {
//                   return const Center(
//                       child: AppText(text: 'No ratings available', size: 0.03));
//                 }

//                 final ratings = ratingSnapshot.data!;
//                 return ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: nearestShops.length,
//                   itemBuilder: (context, index) {
//                     final shopDetails =
//                         nearestShops[index].data() as Map<String, dynamic>;

//                     // Ensure you are retrieving the correct shop ID
//                     final shopId = shopDetails['id'];

//                     // Fetch the total rating count for this shop
//                     final totalRatingCount = ratings[shopId] ?? 0;

//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal:
//                             Mymediaquery().mediaquerywidth(0.03, context),
//                         vertical:
//                             Mymediaquery().mediaqueryheight(0.003, context),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ShopDetailsPage(
//                               shopdetails: shopDetails,
//                               tag: shopDetails[Shopkeys.licenceimagepath],
//                             ),
//                           ));
//                         },
//                         child: Card(
//                           elevation: 20,
//                           color: Myappallcolor().appbackgroundcolor,
//                           child: SizedBox(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: Mymediaquery()
//                                       .mediaquerywidth(0.02, context),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: Mymediaquery()
//                                         .mediaqueryheight(0.01, context),
//                                   ),
//                                   child: ImageContainer(
//                                     tag: shopDetails[Shopkeys.licenceimagepath],
//                                     imagepath:
//                                         shopDetails[Shopkeys.bannerimagepath],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: Mymediaquery()
//                                       .mediaquerywidth(0.04, context),
//                                 ),
//                                 ListtileText(
//                                     shoplocation:
//                                         shopDetails[Shopkeys.locationaddress],
//                                     shopname: shopDetails[Shopkeys.shopname],
//                                     phone: shopDetails[Shopkeys.phone],
//                                     startingtime:
//                                         shopDetails[Shopkeys.startingtime],
//                                     closingtime:
//                                         shopDetails[Shopkeys.closingtime]),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: Mymediaquery()
//                                           .mediaqueryheight(0.009, context)),
//                                   child: Column(
//                                     children: [
//                                       const Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                         size: 20,
//                                       ),
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             color: Myappallcolor().colorwhite,
//                                           ),
//                                           height: Mymediaquery()
//                                               .mediaqueryheight(0.02, context),
//                                           width: Mymediaquery()
//                                               .mediaquerywidth(0.07, context),
//                                           child: Center(
//                                               child: Text(
//                                             totalRatingCount.toString(),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.w600),
//                                           ))),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
class Homescreenlist extends StatelessWidget {
  final Future<Map<dynamic, dynamic>>? ratingCounts;

  const Homescreenlist({
    Key? key,
    required this.ratingCounts,
  }) : super(key: key);

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
            child: AppText(text: 'No internet connection', size: 0.04),
          );
        }
        final nearestShopsFuture = fetchNearestShops(context);
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: nearestShopsFuture,
          builder: (context, nearestShopsSnapshot) {
            if (nearestShopsSnapshot.connectionState ==
                ConnectionState.waiting) {
              return const HomeScreenPlaceholder();
            } else if (nearestShopsSnapshot.hasError) {
              return Center(
                child: Text('Error: ${nearestShopsSnapshot.error}'),
              );
            } else if (!nearestShopsSnapshot.hasData ||
                nearestShopsSnapshot.data!.isEmpty) {
              return const Center(
                child: Text('Oops Please refresh',
                    style: TextStyle(color: Colors.white)),
              );
            }

            final nearestShops = nearestShopsSnapshot.data!;
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
                    ),
                  );
                } else if (!ratingSnapshot.hasData ||
                    ratingSnapshot.data!.isEmpty) {
                  return const Center(
                    child: AppText(
                      text: 'Oops Please refresh',
                      size: 0.03,
                    ),
                  );
                }

                final ratings = ratingSnapshot.data!;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: nearestShops.length,
                  itemBuilder: (context, index) {
                    final shopDetails = nearestShops[index];
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
                                    tag: shopDetails[Shopkeys.licenceimagepath],
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
                                      shopDetails[Shopkeys.closingtime],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Mymediaquery()
                                        .mediaqueryheight(0.009, context),
                                  ),
                                  child: Column(
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
                                            .mediaqueryheight(0.02, context),
                                        width: Mymediaquery()
                                            .mediaquerywidth(0.07, context),
                                        child: Center(
                                          child: Text(
                                            totalRatingCount.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
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
      },
    );
  }
}
