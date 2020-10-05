import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PodcastBaseButton extends StatelessWidget {
  const PodcastBaseButton({
    Key key,
    this.icon,
    this.size,
  }) : super(key: key);

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Color(0xff973961),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: SvgPicture.asset(
            'icons/$icon.svg',
            height: size / 2,
            width: size / 2,
          ),
        ),
      ),
    );
  }
}
