import 'package:url_launcher/url_launcher.dart';

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'mulltechsoftware@gmail.com',
  query: 'subject=Subject&body=App Version 3.23',
);
