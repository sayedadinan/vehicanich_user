import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/my_bookings/completed_bookings/completed_bookings.dart';
import 'package:vehicanich/widgets/my_bookings/pending_bookings/pending_bookings.dart';

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
                Tab(text: 'Pending bookings'),
                Tab(text: 'Completed bookings'),
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
          const Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [PendingBookingTab(), CompletedBookings()],
            ),
          ),
        ],
      ),
    );
  }
}
