import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ne_proj/screens/launch_screen.dart';
import 'package:ne_proj/theme.dart';

import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // To Prevent the App from going in Lanscape Mode, We lock it in Potrait
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // This Allows us to change the Naviagtion and Status Bar Color of Device
      statusBarColor: primaryColor, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));

    return MaterialApp(
      title: 'Yodha',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: LaunchScreen(),
    );
  }
}
