import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';

Widget buildServiceButtonBody(String buttonText, String serviceMapKey,
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
    fontSize: 0.04,
    buttontextcolor: Myappallcolor().colorwhite,
  );
}

Widget buildServiceButtonInterior(String buttonText, String serviceMapKey,
    BuildContext context, String shopPhone) {
  return CustomButton(
    bordercolor: Myappallcolor().colorwhite,
    color: Colors.transparent,
    function: () {
      context.read<BodyMaintainceBloc>().add(
            InteriorButtonPressed(
              servicemapkey: serviceMapKey,
              shopphone: shopPhone,
            ),
          );
    },
    text: buttonText,
    fontSize: 0.04,
    buttontextcolor: Myappallcolor().colorwhite,
  );
}

Widget buildServiceButtonEngine(String buttonText, String serviceMapKey,
    BuildContext context, String shopPhone) {
  return CustomButton(
    bordercolor: Myappallcolor().colorwhite,
    color: Colors.transparent,
    function: () {
      context.read<BodyMaintainceBloc>().add(
            EngineServiceButtonPressed(
              servicemapkey: serviceMapKey,
              shopphone: shopPhone,
            ),
          );
    },
    text: buttonText,
    fontSize: 0.04,
    buttontextcolor: Myappallcolor().colorwhite,
  );
}
