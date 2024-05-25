import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vehicanich/utils/mediaquery.dart';

class HomeScreenPlaceholder extends StatelessWidget {
  const HomeScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              right: Mymediaquery().mediaquerywidth(0.06, context),
              left: Mymediaquery().mediaquerywidth(0.06, context)),
          child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 61, 62, 68),
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              height: Mymediaquery().mediaqueryheight(0.12, context),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    color: Colors.amber,
                    width: Mymediaquery().mediaquerywidth(0.27, context),
                    height: Mymediaquery().mediaqueryheight(0.10, context),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: Mymediaquery().mediaqueryheight(0.02, context),
        );
      },
      itemCount: 3,
    );
  }
}
