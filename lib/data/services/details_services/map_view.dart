// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class MapViews {
  void launchMap(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
