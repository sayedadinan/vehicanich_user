import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/mediaquery.dart';

Widget buildServiceButton(String buttonText, String serviceMapKey,
    BuildContext context, String shopPhone) {
  return CustomButton(
    bordercolor: Myappallcolor().colorwhite,
    color: Colors.transparent,
    function: () {
      context.read<BodyMaintainceBloc>().add(
            BodyMaintainceButtonPressed(
              servicemapkey: serviceMapKey,
              shopphone: shopPhone,
            ),
          );
    },
    text: buttonText,
    fontSize: Mymediaquery().mediaquerywidth(0.03, context),
    buttontextcolor: Myappallcolor().colorwhite,
  );
}
