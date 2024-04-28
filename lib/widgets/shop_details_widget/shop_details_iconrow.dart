import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class DetailsPageRow extends StatelessWidget {
  const DetailsPageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.03, context)),
        const IconSetup(icon: Icons.call_outlined),
        SizedBox(width: Mymediaquery().mediaquerywidth(0.03, context)),
        const IconSetup(icon: Icons.send),
        SizedBox(width: Mymediaquery().mediaquerywidth(0.03, context)),
        const IconSetup(icon: Icons.message_rounded),
        SizedBox(width: Mymediaquery().mediaquerywidth(0.03, context)),
        const IconSetup(icon: Icons.share)
      ],
    );
  }
}

class IconSetup extends StatelessWidget {
  final IconData icon;
  const IconSetup({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Mymediaquery().mediaqueryheight(0.07, context),
      width: Mymediaquery().mediaquerywidth(0.07, context),
      decoration: BoxDecoration(
          border: Border.all(color: Myappallcolor().colorwhite),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Icon(
          icon,
          color: Myappallcolor().colorwhite,
          size: Mymediaquery().mediaquerywidth(0.03, context),
        ),
      ),
    );
  }
}
