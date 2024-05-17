import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/blocs/payment_blocs/bloc/payment_bloc.dart';
import 'package:vehicanich/screens/success_screen/success_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_sizedbox.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/app_textvalidators.dart';
import 'package:vehicanich/utils/bottom_navigation/bottom_navigation.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/widget_arrangements/additional_text.dart';
import 'package:vehicanich/widgets/details_widget/widget_arrangements/booking_instruction.dart';
import 'package:vehicanich/widgets/details_widget/widget_arrangements/custom_text.dart';
import 'package:vehicanich/widgets/details_widget/details_text.dart';

// ignore: must_be_immutable
class BookingScreen extends StatelessWidget {
  final String servicename;
  final String phonenumber;
  BookingScreen({
    super.key,
    required this.servicename,
    required this.phonenumber,
  });
  TextEditingController vehiclenumberController = TextEditingController();
  TextEditingController userbookingphoneController = TextEditingController();
  late DateTime selectingdate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      appBar: PreferredSize(
        preferredSize: Size(
            double.infinity, Mymediaquery().mediaqueryheight(0.183, context)),
        child: CustomAppbar(
          appbartext: servicename,
        ),
      ),
      body: BlocProvider(
        create: (context) => PaymentBloc(),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentSuccess) {
              return const SuccessScreen();
              // Navigator.of(context)
              //     .push(FadeTransitionPageRoute(child: SuccessScreen()));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSizedBoxHeight(0.05),
                  const CustomizedText(text: detailspagestatictext),
                  const CustomSizedBoxHeight(0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.04, context),
                        right: Mymediaquery().mediaquerywidth(0.04, context)),
                    child: EasyDateTimeLine(
                      disabledDates: [DateTime.utc(2024, 05, 05)],
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        selectingdate = selectedDate;
                      },
                    ),
                  ),
                  const CustomSizedBoxHeight(0.03),
                  Inputfield(
                      hinttext: 'your vehicle number',
                      controller: vehiclenumberController,
                      validator: (value) =>
                          Validators().validateVehicleNumber(value)),
                  const CustomSizedBoxHeight(0.02),
                  Inputfield(
                      hinttext: 'your phone number',
                      controller: userbookingphoneController,
                      validator: (value) =>
                          Validators().validatePhoneNumber(value)),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.06, context)),
                  const BookingInstructions(),
                  const CustomSizedBoxHeight(0.02),
                  const PriceAdditionalText(),
                  const CustomSizedBoxHeight(0.03),
                  CustomButton(
                      color: Myappallcolor().buttonforgroundcolor,
                      function: () {
                        context
                            .read<PaymentBloc>()
                            .add(PaymentButtonPressed(amount: '100.0'));
                        context.read<BookingBloc>().add(BookingbuttonPressed(
                              shopphonenumber: phonenumber,
                              datepicked: selectingdate,
                              vehiclenumbercontroller:
                                  vehiclenumberController.text,
                              userphonenumbercontroller:
                                  userbookingphoneController.text,
                              servicename: servicename,
                            ));
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => BottomBar()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      text: 'Proceed to pay',
                      fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                      buttontextcolor: Myappallcolor().colorwhite,
                      bordercolor: Colors.transparent),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.05, context)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
