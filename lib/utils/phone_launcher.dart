import 'package:url_launcher/url_launcher.dart';


class PhoneLauncher {

  static Future<void> makeCall(String number) async {

    final Uri url = Uri(
      scheme: "tel",
      path: number,
    );


    if (await canLaunchUrl(url)) {

      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

    } else {

      throw Exception(
        "Could not launch phone dialer",
      );

    }

  }

}