// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class WhatsappService {
  void launchWhatsApp(String phoneNumber, String message) async {
    print(phoneNumber);
    print(message);
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
