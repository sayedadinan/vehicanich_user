import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ShopDetailImage extends StatelessWidget {
  final String tag;
  final String imagepath;
  const ShopDetailImage(
      {super.key, required this.tag, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(39),
          bottomRight: Radius.circular(39),
        ),
        color: Myappallcolor().appbackgroundcolor,
      ),
      width: double.infinity,
      height: Mymediaquery().mediaqueryheight(0.27, context),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(39),
          bottomRight: Radius.circular(39),
          topLeft: Radius.circular(39),
          topRight: Radius.circular(39),
        ),
        child: Hero(
          tag: tag.toString(),
          child: Image.network(
            imagepath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
