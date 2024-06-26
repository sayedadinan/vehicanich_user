import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class Myonboardmaintitle extends StatelessWidget {
  final String title;
  final Color textcolor;
  final double size;
  const Myonboardmaintitle(
      {super.key,
      required this.title,
      required this.textcolor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textcolor,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Myonboardingsmalltext extends StatelessWidget {
  final String subtitle;
  const Myonboardingsmalltext({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        subtitle,
        style: TextStyle(
          color: Myappallcolor().textcolor,
          fontSize: MediaQuery.of(context).size.width * 0.08,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }
}

class Loginorsigntext extends StatelessWidget {
  const Loginorsigntext({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.1, context)),
          child: Text(
            'make your choice perfect',
            style: TextStyle(
                fontSize: Mymediaquery().mediaquerywidth(0.06, context),
                color: Myappallcolor().colorwhite),
          ),
        ),
      ],
    );
  }
}
