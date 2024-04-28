import 'package:flutter/material.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ImageContainer extends StatelessWidget {
  final String imagepath;
  final String tag;
  const ImageContainer({super.key, required this.imagepath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Mymediaquery().mediaquerywidth(0.09, context),
      height: Mymediaquery().mediaqueryheight(0.10, context),
      child: Hero(
        tag: tag.toString(),
        child: Image.network(
          imagepath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
