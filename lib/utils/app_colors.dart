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
  AppColor(
      {required this.appbackgroundcolor,
      required this.bottomnavigationforcolor,
      required this.textcolor,
      required this.buttonforgroundcolor,
      required this.colorwhite,
      required this.colorblack,
      required this.appbarbackgroundcolor,
      required this.emergencybuttoncolor});
}

final class Myappallcolor extends AppColor {
  Myappallcolor()
      : super(
            bottomnavigationforcolor: const Color.fromARGB(0, 0, 0, 0),
            emergencybuttoncolor: const Color.fromARGB(255, 177, 37, 42),
            appbarbackgroundcolor: const Color.fromARGB(255, 46, 96, 89),
            colorblack: Colors.black,
            colorwhite: Colors.white,
            appbackgroundcolor: const Color.fromARGB(255, 4, 59, 73),
            textcolor: const Color.fromARGB(255, 167, 199, 198),
            buttonforgroundcolor: const Color.fromARGB(255, 17, 187, 180));
}
