import 'package:flutter/material.dart';

class Utility {
  static getSnackBar({String text, BuildContext context}) {
    return SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Sen',
            fontSize: 12,
            color: Color(0xff973961)),
      ),
    );
  }
}
