import 'package:flutter/material.dart';

class AppColor {
  final Color appbackgroundcolor;
  final Color textcolor;
  final Color buttonforgroundcolor;
  final Color colorwhite;
  final Color colorblack;
  final Color appbarbackgroundcolor;
  final Color emergencybuttoncolor;
  final Color bottomnavigationforcolor;
  final Color listcontainer;
  final Color detailspageboxcolor;
  final Color bookingCardColor;
  AppColor(
      {required this.appbackgroundcolor,
      required this.bottomnavigationforcolor,
      required this.textcolor,
      required this.buttonforgroundcolor,
      required this.colorwhite,
      required this.colorblack,
      required this.appbarbackgroundcolor,
      required this.emergencybuttoncolor,
      required this.listcontainer,
      required this.detailspageboxcolor,
      required this.bookingCardColor});
}

final class Myappallcolor extends AppColor {
  Myappallcolor()
      : super(
            // appbackgroundcolor: Colors.black,
            bottomnavigationforcolor: const Color.fromARGB(0, 0, 0, 0),
            emergencybuttoncolor: const Color.fromARGB(255, 127, 28, 31),
            appbarbackgroundcolor: const Color.fromARGB(255, 46, 96, 89),
            colorblack: Colors.black,
            colorwhite: Colors.white,
            appbackgroundcolor: const Color.fromARGB(255, 0, 26, 33),
            textcolor: const Color.fromARGB(255, 167, 199, 198),
            buttonforgroundcolor: const Color.fromARGB(255, 17, 187, 180),
            listcontainer: const Color.fromARGB(255, 71, 100, 108),
            detailspageboxcolor: const Color.fromARGB(255, 27, 66, 60),
            bookingCardColor: const Color.fromARGB(255, 1, 38, 48));
}
