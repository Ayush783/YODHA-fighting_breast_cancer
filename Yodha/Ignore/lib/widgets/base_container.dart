import 'package:flutter/material.dart';

import '../const.dart';

class BaseContainer extends StatefulWidget {
  const BaseContainer({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Color(0xff973961),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: selected ? Color(0xffffbfb9) : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: primary.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
