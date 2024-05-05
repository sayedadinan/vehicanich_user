import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ImageContainer extends StatelessWidget {
  final String imagepath;
  final String tag;
  const ImageContainer({super.key, required this.imagepath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Mymediaquery().mediaquerywidth(0.27, context),
      height: Mymediaquery().mediaqueryheight(0.10, context),
      child: Hero(
          tag: tag.toString(),
          child: CachedNetworkImage(
            imageUrl: imagepath,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
    );
  }
}
