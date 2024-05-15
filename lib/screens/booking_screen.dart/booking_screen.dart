import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/booking_bloc/booking_bloc.dart';
import 'package:vehicanich/screens/home_screen/home_screens.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_appbar.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/app_textvalidators.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/details_widget/custom_text.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Mymediaquery().mediaqueryheight(0.05, context)),
            const CustomizedText(text: detailspagestatictext),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
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
            SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
            Inputfield(
                hinttext: 'your vehicle number',
                controller: vehiclenumberController,
                validator: (value) =>
                    Validators().validateVehicleNumber(value)),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
            Inputfield(
                hinttext: 'your phone number',
                controller: userbookingphoneController,
                validator: (value) => Validators().validatePhoneNumber(value)),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.06, context)),
            Container(
              decoration: BoxDecoration(
                  color: Myappallcolor().detailspageboxcolor,
                  border: Border.all(color: Myappallcolor().colorwhite),
                  borderRadius: BorderRadius.circular(12)),
              width: Mymediaquery().mediaquerywidth(0.78, context),
              height: Mymediaquery().mediaqueryheight(0.21, context),
              child: Column(
                children: [
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.03, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        detailscontainerpricetext,
                        style: TextStyle(color: Myappallcolor().colorwhite),
                      )
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.02, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        detailscontainerdescriptiontext,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Myappallcolor().colorwhite,
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.03, context)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
                Text(
                  detailspricedescription,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Myappallcolor().colorwhite,
                      fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
                )
              ],
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
            CustomButton(
                color: Myappallcolor().buttonforgroundcolor,
                function: () {
                  context.read<BookingBloc>().add(BookingbuttonPressed(
                        shopphonenumber: phonenumber,
                        datepicked: selectingdate,
                        vehiclenumbercontroller: vehiclenumberController.text,
                        userphonenumbercontroller:
                            userbookingphoneController.text,
                        servicename: servicename,
                      ));
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                text: 'Proceed to pay',
                fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                buttontextcolor: Myappallcolor().colorwhite,
                bordercolor: Colors.transparent),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.05, context)),
          ],
        ),
      ),
    );
  }
}
