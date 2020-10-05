import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';

Widget appBar = AppBar(
  leading: Container(
    width: 0,
    height: 0,
  ),
  backgroundColor: Color(0xff973961),
  title: Row(
    children: [
      Padding(padding: EdgeInsets.only(right: 60)),
      Text(
        'Yodha',
        style: title.copyWith(fontWeight: FontWeight.bold),
      ),
      Image.asset(
        'images/small_logo.png',
        height: 31,
        width: 40,
      )
    ],
  ),
);
