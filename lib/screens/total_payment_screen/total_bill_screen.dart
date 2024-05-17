import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class TotalBillScreen extends StatelessWidget {
  const TotalBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: const CustomAppbar(
          appbartext: 'Total your work payment ',
        ),
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: Column(
        children: [Text('total bill')],
      ),
    );
  }
}
