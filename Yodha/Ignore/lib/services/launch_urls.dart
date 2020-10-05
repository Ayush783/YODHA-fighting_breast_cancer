import 'package:url_launcher/url_launcher.dart';

//to open links in browser
launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//to open the dialpad after clicking on call button
launchDialPad(String number) async {
  String url = "tel:$number";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
