import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/search_bloc/bloc/search_bloc.dart';
import 'package:vehicanich/data/data_provider/shop_data.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich/screens/shop_details_screen/details_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/connectivity_widget/connectivity_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';
import 'package:vehicanich/widgets/home_screen_widgets/shimmer_effect.dart';
import 'package:vehicanich/widgets/search_widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: StreamBuilder(
          stream: checkInternetConnection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const HomeScreenPlaceholder();
            }
            if (!snapshot.hasData || !snapshot.data!) {
              return const ConnectivityWidget();
            }
            return Column(
              children: [
                const CustomSizedBoxHeight(0.03),
                const CustomSearchField(),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return StreamBuilder<QuerySnapshot>(
                        stream: ShopReference()
                            .shopCollectionReference()
                            .where(Shopkeys.isApproved, isEqualTo: true)
                            .where(Shopkeys.isRejected, isEqualTo: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const HomeScreenPlaceholder();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return const Text('No data available');
                          } else {
                            var shops = snapshot.data!.docs;
                            if (state.query.isNotEmpty) {
                              shops = shops.where((shop) {
                                var shopName = shop[Shopkeys.shopname]
                                    .toString()
                                    .toLowerCase();
                                return shopName
                                    .contains(state.query.toLowerCase());
                              }).toList();
                            }
                            // Display all shops
                            return shops.isEmpty
                                ? const Text(
                                    'No shops found matching your search')
                                : buildShopList(shops);
                          }
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            );
          }),
    );
  }

  Widget buildShopList(List<DocumentSnapshot> shopDocs) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: shopDocs.length,
        itemBuilder: (context, index) {
          final shopDetails = shopDocs[index].data() as Map<String, dynamic>;
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
                  ),
                ));
              },
              child: Card(
                elevation: 20,
                color: Myappallcolor().appbackgroundcolor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.02, context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Mymediaquery().mediaqueryheight(0.01, context),
                      ),
                      child: ImageContainer(
                        tag: shopDetails[Shopkeys.licenceimagepath],
                        imagepath: shopDetails[Shopkeys.bannerimagepath],
                      ),
                    ),
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.04, context),
                    ),
                    ListtileText(
                      shoplocation: shopDetails[Shopkeys.locationaddress],
                      shopname: shopDetails[Shopkeys.shopname],
                      phone: shopDetails[Shopkeys.phone],
                      startingtime: shopDetails[Shopkeys.startingtime],
                      closingtime: shopDetails[Shopkeys.closingtime],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
