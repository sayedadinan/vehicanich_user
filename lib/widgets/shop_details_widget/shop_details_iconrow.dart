import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/screens/chat_room/chat_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';

class DetailsPageRow extends StatelessWidget {
  final String shopPhone;
  const DetailsPageRow({super.key, required this.shopPhone});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatingBloc, ChatingState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            const IconSetup(icon: Icons.call_outlined),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            const IconSetup(icon: Icons.send),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            GestureDetector(
                onTap: () {
                  print(state.shopId);
                  print(shopPhone);
                  Navigator.of(context).push(FadeTransitionPageRoute(
                      child: ChatPage(
                    receiverUserPhone: shopPhone,
                    receiverUserID: state.shopId,
                  )));
                },
                child: IconSetup(icon: Icons.message_rounded)),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            const IconSetup(icon: Icons.share)
          ],
        );
      },
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
      width: Mymediaquery().mediaquerywidth(0.16, context),
      decoration: BoxDecoration(
          border: Border.all(color: Myappallcolor().colorwhite),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Icon(
          icon,
          color: Myappallcolor().colorwhite,
          size: Mymediaquery().mediaquerywidth(0.06, context),
        ),
      ),
    );
  }
}
