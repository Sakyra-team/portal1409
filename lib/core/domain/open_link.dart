import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  if (!await launchUrl(Uri.parse("https://my1409.ru/$url"))) {
    throw Exception('Could not launch ');
  }
}
