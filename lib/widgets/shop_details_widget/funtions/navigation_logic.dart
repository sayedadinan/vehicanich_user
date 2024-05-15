import 'package:flutter/material.dart';
import 'package:vehicanich/blocs/booking_blocs/body_main_bloc/body_maintaince_bloc.dart';
import 'package:vehicanich/screens/body_maintaince_screens/body_maintains_category.dart';
import 'package:vehicanich/utils/page_transition/page_slide_transition.dart';

void navigateBasedOnState(BuildContext context, dynamic state) {
  if (state is BodyMaintaincebuttonNavigation) {
    Navigator.of(context).push(SlideTransitionPageRoute(
        child: const ServiceDetails(
      textforappbar: 'Body Maintaince and \n Repair',
    )));
  }
  if (state is InteriorServiceeButtonNavigation) {
    Navigator.of(context).push(SlideTransitionPageRoute(
        child: const ServiceDetails(
      textforappbar: '       Interior Services',
    )));
  }
  if (state is EngineServiceeButtonNavigation) {
    Navigator.of(context).push(SlideTransitionPageRoute(
        child: const ServiceDetails(
      textforappbar: 'Engine and Mechanical Services',
    )));
  }
}
