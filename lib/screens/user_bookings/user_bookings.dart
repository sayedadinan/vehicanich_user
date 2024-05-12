import 'package:flutter/material.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_loader.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class UserBookingsPage extends StatelessWidget {
  const UserBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Myappallcolor().appbarbackgroundcolor,
        title: const Text(
          'My bookings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const _UserBookingsBody(),
    );
  }
}

class _UserBookingsBody extends StatelessWidget {
  const _UserBookingsBody();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          Container(
            color: Myappallcolor().appbackgroundcolor,
            height: Mymediaquery().mediaqueryheight(0.03, context),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Myappallcolor().appbackgroundcolor,
            child: TabBar(
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
              ],
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: Myappallcolor().textcolor,
              ),
              dividerColor: Myappallcolor().appbackgroundcolor,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Myappallcolor().appbarbackgroundcolor,
              indicatorColor: Myappallcolor().buttonforgroundcolor,
              unselectedLabelColor: Myappallcolor().colorwhite,
              physics: const ClampingScrollPhysics(),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  color: Myappallcolor().appbackgroundcolor,
                  child: Center(
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: UserRepository().userMybookings(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return loader;
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final bookingData = snapshot.data;
                        if (bookingData != null && bookingData.isNotEmpty) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final bookings = snapshot.data![index];
                              print(bookings['shopphone']);
                              // final shopPhone = booking['shopphone'];
                              // Add other booking details here
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: Mymediaquery()
                                      .mediaquerywidth(0.03, context),
                                  right: Mymediaquery()
                                      .mediaquerywidth(0.03, context),
                                  top: Mymediaquery()
                                      .mediaqueryheight(0.01, context),
                                  bottom: Mymediaquery()
                                      .mediaqueryheight(0.00, context),
                                ),
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Myappallcolor().listcontainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    height: Mymediaquery()
                                        .mediaqueryheight(0.12, context),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: Mymediaquery()
                                                  .mediaquerywidth(
                                                      0.05, context)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Rowforcontainer(
                                                  valuetext: bookings[
                                                      ReferenceKeys
                                                          .servicename],
                                                  keytext: 'Service Category'),
                                              Rowforcontainer(
                                                  valuetext: bookings[
                                                      ReferenceKeys
                                                          .vehiclenumber],
                                                  keytext: 'Vehicle Number'),
                                              Rowforcontainer(
                                                  valuetext: bookings[
                                                      ReferenceKeys.date],
                                                  keytext: 'booked date'),
                                              Rowforcontainer(
                                                  valuetext: bookings[
                                                      ReferenceKeys.shopphone],
                                                  keytext: 'shop phone'),
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
                        } else {
                          return const Text('No bookings available.');
                        }
                      }
                    },
                  )),
                ),
                Container(
                  color: Myappallcolor().appbackgroundcolor,
                  child: const Center(
                    child: Text('Second Tab Content'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Rowforcontainer extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const Rowforcontainer(
      {super.key, required this.valuetext, required this.keytext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.32, context),
          child: Text(keytext),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 20,
            color: Myappallcolor().textcolor,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.04, context)),
            child: Text(
              valuetext,
            )),
      ],
    );
  }
}
