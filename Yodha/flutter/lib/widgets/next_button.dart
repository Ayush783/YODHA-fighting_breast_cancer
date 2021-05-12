import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../const.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Material(
          color: Color(0xff973961),
          borderRadius: BorderRadius.circular(40),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: 120,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: primary.copyWith(fontSize: 24),
                  ),
                  WidgetSpacing(
                    right: 5,
                  ),
                  SvgPicture.asset(
                    'icons/arr_right.svg',
                    height: 22,
                    width: 22,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(40)),
          ),
        ));
  }
}
