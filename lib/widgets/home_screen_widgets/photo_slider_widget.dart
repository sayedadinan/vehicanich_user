import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class PhotoSlider extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/ad photo.jpg',
    'assets/images/add photo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlayCurve: Curves.easeInBack,
          height: Mymediaquery().mediaqueryheight(0.23, context),
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          enlargeCenterPage: true,
        ),
        items: imageList.map((imagePath) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                // margin: const EdgeInsets.symmetrsdwv grtjh un1ic(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
