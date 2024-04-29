import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class ShopTextArrange extends StatelessWidget {
  final String shopname;
  const ShopTextArrange({super.key, required this.shopname});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          shopname,
          style: TextStyle(
              fontFamily: 'Oswald',
              color: Myappallcolor().colorwhite,
              fontWeight: FontWeight.w300,
              fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.05, context),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Myappallcolor().colorwhite,
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.01, context),
            ),
            Text(
              'Map View',
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontWeight: FontWeight.w400,
                  fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
            ),
          ],
        ),
      ],
    );
  }
}

class ShopTimeText extends StatelessWidget {
  final String startingtime;
  final String closingtime;
  const ShopTimeText(
      {super.key, required this.startingtime, required this.closingtime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Mymediaquery().mediaquerywidth(0.35, context),
      height: Mymediaquery().mediaqueryheight(0.03, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Myappallcolor().appbarbackgroundcolor)),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.02, context),
            ),
            Text(
              'working time',
              style: TextStyle(
                  color: Myappallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.02, context),
            ),
            Text(
              startingtime,
              style: TextStyle(
                color: Myappallcolor().colorwhite,
              ),
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.01, context),
            ),
            Text(
              'to',
              style: TextStyle(color: Myappallcolor().colorwhite),
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.01, context),
            ),
            Text(
              closingtime,
              style: TextStyle(color: Myappallcolor().colorwhite),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPageCrButton extends StatelessWidget {
  const DetailsPageCrButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.03, context),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Myappallcolor().colorwhite),
              borderRadius: BorderRadius.circular(8)),
          width: Mymediaquery().mediaqueryheight(0.09, context),
          height: Mymediaquery().mediaqueryheight(0.02, context),
          child: Center(
            child: Text('CR & BOARD',
                style: TextStyle(color: Myappallcolor().colorwhite)),
          ),
        ),
      ],
    );
  }
}

class DetailsPageDescription extends StatelessWidget {
  const DetailsPageDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Myappallcolor().textcolor,
      width: Mymediaquery().mediaquerywidth(0.39, context),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu",
        style: TextStyle(color: Myappallcolor().colorwhite),
      ),
    );
  }
}

class DetailsPageTitleText extends StatelessWidget {
  final String titletext;
  const DetailsPageTitleText({super.key, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return Text(
      titletext,
      style: TextStyle(
          color: Myappallcolor().colorwhite,
          fontWeight: FontWeight.w400,
          fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
    );
  }
}
