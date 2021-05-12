import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../const.dart';

class CallButton extends StatelessWidget {
  const CallButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(40),
      color: Color(0xff5D13E7),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        width: 150,
        height: 50,
        child: Row(
          children: [
            Text(
              'Call',
              style: primary.copyWith(fontSize: 24),
            ),
            WidgetSpacing(
              right: 12,
            ),
            SvgPicture.asset('icons/call.svg')
          ],
        ),
      ),
    );
  }
}
