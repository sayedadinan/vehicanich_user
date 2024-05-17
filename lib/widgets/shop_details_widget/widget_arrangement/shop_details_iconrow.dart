import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vehicanich/blocs/chat_bloc/bloc/chating_bloc.dart';
import 'package:vehicanich/data/repositories/shop_details/shop_details_keys.dart';
import 'package:vehicanich/data/services/details_services/call_services.dart';
import 'package:vehicanich/data/services/details_services/whatsapp_service.dart';
import 'package:vehicanich/screens/chat_room/chat_page.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/utils/page_transition/page_fade_transition.dart';

class DetailsPageRow extends StatelessWidget {
  final Map<String, dynamic> shopdetails;
  final String shopPhone;
  const DetailsPageRow(
      {super.key, required this.shopPhone, required this.shopdetails});
  final shop = 9744157749;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatingBloc, ChatingState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            InkWell(
              onTap: () {
                print(shopPhone);
                CallService().makePhoneCall(shopPhone);
              },
              splashColor: Colors.grey.withOpacity(0.5),
              splashFactory: InkSplash.splashFactory,
              child: const IconSetup(icon: Icons.call_outlined),
            ),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            InkWell(
                onTap: () {
                  WhatsappService().launchWhatsApp(
                      shop.toString(), 'this is a message from vehicanich');
                },
                child: const IconSetup(icon: Icons.send)),
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
                child: const IconSetup(icon: Icons.message_rounded)),
            SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
            InkWell(
                onTap: () {
                  Share.share(
                      'Shop Name : ${shopdetails[Shopkeys.shopname]},     Phone : $shopPhone,Location : ${shopdetails[Shopkeys.locationaddress]}');
                },
                child: const IconSetup(icon: Icons.share))
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
