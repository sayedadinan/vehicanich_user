import 'package:flutter/material.dart';
import 'package:vehicanich/data/repositories/user_repositery.dart';
import 'package:vehicanich/utils/app_colors.dart';
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
                        return const CircularProgressIndicator();
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
                                  color: Myappallcolor().listcontainer,
                                  child: SizedBox(
                                    height: Mymediaquery()
                                        .mediaqueryheight(0.16, context),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Mymediaquery()
                                              .mediaquerywidth(0.02, context),
                                        ),
                                        Text(
                                          bookings['shopphone'] ??
                                              'Shop Phone not available',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: Mymediaquery()
                                              .mediaquerywidth(0.23, context),
                                        ),
                                        Text(
                                          bookings['date'] ??
                                              'Shop Phone not available',
                                          style: const TextStyle(
                                              color: Colors.white),
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
