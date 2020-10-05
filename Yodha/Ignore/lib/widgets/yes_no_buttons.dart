import 'package:flutter/material.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../const.dart';

class YesNoButtons extends StatefulWidget {
  bool isYes, isNo;
  YesNoButtons(this.isYes, this.isNo);
  @override
  _YesNoButtonsState createState() => _YesNoButtonsState();
}

class _YesNoButtonsState extends State<YesNoButtons> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0555),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.isYes = !widget.isYes;
              widget.isNo = false;
              setState(() {});
            },
            child: Material(
              elevation: 4,
              color: widget.isYes ? Colors.white : Color(0xff973961),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: Colors.white)),
              child: Container(
                height: 50,
                width: 120,
                child: Center(
                    child: Text(
                  'Yes',
                  style: primary.copyWith(
                      fontSize: 22,
                      color: widget.isYes ? Color(0xff973961) : Colors.white),
                )),
              ),
            ),
          ),
          WidgetSpacing(
            right: 20,
          ),
          GestureDetector(
            onTap: () {
              widget.isYes = false;
              widget.isNo = !widget.isNo;
              setState(() {});
            },
            child: Material(
              elevation: 4,
              color: widget.isNo ? Colors.white : Color(0xff973961),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: Colors.white)),
              child: Container(
                height: 50,
                width: 120,
                child: Center(
                    child: Text(
                  'No',
                  style: primary.copyWith(
                      fontSize: 22,
                      color: widget.isNo ? Color(0xff973961) : Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
