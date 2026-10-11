import 'package:url_launcher/url_launcher.dart';
import '../app/constants/app_constants.dart';

class UrlLauncherUtils {
  UrlLauncherUtils._();

  static Future<void> openWhatsApp({String? customMessage}) async {
    final message = customMessage ?? AppConstants.defaultWhatsappMessage;
    final encodedMessage = Uri.encodeComponent(message);
    final url = 'https://wa.me/${AppConstants.whatsappNumber}?text=$encodedMessage';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openPhone({String? phoneNumber}) async {
    final number = phoneNumber ?? AppConstants.phoneRaw;
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openEmail({String? emailAddress, String? subject}) async {
    final mail = emailAddress ?? AppConstants.email;
    final subj = Uri.encodeComponent(subject ?? 'Inquiry for MK Catering & Event Management');
    final uri = Uri.parse('mailto:$mail?subject=$subj');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openExternalUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
