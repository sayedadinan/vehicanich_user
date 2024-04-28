import 'package:flutter/material.dart';
import 'package:vehicanich/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/repositories/shop_details/shop_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
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
                  child: Card(
                    color: Myappallcolor().listcontainer,
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
                                  imagepath:
                                      shopDetails[Shopkeys().bannerimagepath])),
                          SizedBox(
                              width: Mymediaquery()
                                  .mediaquerywidth(0.09, context)),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Mymediaquery()
                                    .mediaqueryheight(0.02, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  shopDetails[Shopkeys().name],
                                  style: TextStyle(),
                                ),
                                Text(shopDetails[Shopkeys().startingtime]),
                                Text(shopDetails[Shopkeys().whatsapp])
                              ],
                            ),
                          ),
                        ],
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
