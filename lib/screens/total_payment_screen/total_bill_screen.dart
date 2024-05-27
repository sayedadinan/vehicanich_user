import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/total_bill/bloc/total_bill_bloc.dart';
import 'package:vehicanich/data/data_provider/keys.dart';
import 'package:vehicanich/screens/total_payment_screen/paying_screen.dart';
import 'package:vehicanich/screens/total_payment_screen/total_details_row.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_googlebutton.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_text.dart';
import 'package:vehicanich/utils/app_theme.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';

class TotalBillScreen extends StatefulWidget {
  const TotalBillScreen({super.key, required this.bookings});
  final Map<String, dynamic> bookings;
  @override
  State<TotalBillScreen> createState() => _TotalBillScreenState();
}

class _TotalBillScreenState extends State<TotalBillScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TotalBillBloc>().add(FetchTotalBill(
        shopId: widget.bookings[ReferenceKeys.shopId],
        vehicleNumber: widget.bookings[ReferenceKeys.vehiclenumber],
        serviceName: widget.bookings[ReferenceKeys.servicename]));
  }

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
      body: BlocBuilder<TotalBillBloc, TotalBillState>(
        builder: (context, state) {
          return Column(
            children: [
              const CustomSizedBoxHeight(0.03),
              Padding(
                padding: EdgeInsets.only(
                  right: Mymediaquery().mediaquerywidth(0.06, context),
                  left: Mymediaquery().mediaquerywidth(0.06, context),
                ),
                child: Card(
                  elevation: 20,
                  color: Myappallcolor().bookingCardColor,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MyAppTheme.borderRadiusValue)),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Container(
                                height: Mymediaquery()
                                    .mediaqueryheight(0.04, context),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Myappallcolor().colorwhite)),
                                child: const Center(
                                  child: AppText(
                                      text: 'total details', size: 0.05),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Mymediaquery()
                                        .mediaquerywidth(0.05, context)),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      const CustomSizedBoxHeight(0.01),
                                      totalDetailsRow(
                                        keytext: 'services',
                                        valueText: state.serviceName,
                                      ),
                                      const CustomSizedBoxHeight(0.01),
                                      const Divider(
                                        endIndent: 30,
                                      ),
                                      totalDetailsRow(
                                        keytext: 'vehicle number',
                                        valueText: state.vehicleNumber,
                                      ),
                                      const CustomSizedBoxHeight(0.01),
                                      const Divider(
                                        endIndent: 30,
                                      ),
                                      totalDetailsRow(
                                        keytext: 'booked date',
                                        valueText: state.vehicleNumber,
                                      ),
                                      const CustomSizedBoxHeight(0.01),
                                      const Divider(
                                        endIndent: 30,
                                      ),
                                      Visibility(
                                        visible: state.extraService.isNotEmpty,
                                        child: totalDetailsRow(
                                          keytext: 'extra service',
                                          valueText: state.extraService,
                                        ),
                                      ),
                                      const CustomSizedBoxHeight(0.01),
                                      totalDetailsRow(
                                        keytext: 'Total amount',
                                        valueText: state.totalAmount,
                                      ),
                                      const Divider(
                                        endIndent: 30,
                                      ),
                                      const CustomSizedBoxHeight(0.02),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const CustomSizedBoxHeight(0.05),
              SizedBox(
                width: Mymediaquery().mediaquerywidth(0.84, context),
                child: const AppText(
                    text:
                        "Thank you for choosing our services! Here's a summary of your selected services and the total payment. We kindly request that payment be made before retrieving your vehicle. Should you encounter any issues or have feedback for us, please don't hesitate to let us know. We appreciate your trust in us, and we hope you have a fantastic day!",
                    size: 0.033),
              ),
              const CustomSizedBoxHeight(0.04),
              CustomGoogleButton(
                  color: Myappallcolor().buttonforgroundcolor,
                  function: () {
                    Navigator.of(context).push(FadeTransitionPageRoute(
                        child: PaymentScreen(
                      shopId: widget.bookings[ReferenceKeys.shopId],
                      amount: state.totalAmount,
                    )));
                  },
                  text: 'Ready to Pay',
                  fontSize: 0.04,
                  buttontextcolor: Myappallcolor().colorwhite,
                  bordercolor: Colors.transparent)
            ],
          );
        },
      ),
    );
  }
}
