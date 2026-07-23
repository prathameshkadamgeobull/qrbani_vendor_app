import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailLauncher {
  static Future<void> sendEmail() async {
    final subject = Uri.encodeComponent('Report an Issue');
    final body = Uri.encodeComponent('Please describe your issue here.');

    final Uri emailUri = Uri.parse(
      'mailto:aishwaryashelke16.geobull@gmail.com'
          '?subject=$subject'
          '&body=$body',
    );

    debugPrint("Email URI: $emailUri");

    if (await canLaunchUrl(emailUri)) {
      final launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
      debugPrint("launched: $launched");
    } else {
      debugPrint("Cannot launch email");
    }
  }
}