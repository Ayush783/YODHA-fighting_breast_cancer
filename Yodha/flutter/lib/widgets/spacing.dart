import 'package:flutter/material.dart';

class WidgetSpacing extends StatelessWidget {
  const WidgetSpacing({
    Key key,
    this.left,
    this.top,
    this.right,
    this.bottom,
  }) : super(key: key);

  final double top, left, right, bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
      top: top ?? 0,
      bottom: bottom ?? 0,
      right: right ?? 0,
      left: left ?? 0,
    ));
  }
}
