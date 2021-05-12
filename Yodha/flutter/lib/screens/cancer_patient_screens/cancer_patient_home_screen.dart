import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/services/launch_urls.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/call_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../survey_screen.dart';

class CancerPatientHomeScreen extends StatefulWidget {
  @override
  _CancerPatientHomeScreenState createState() =>
      _CancerPatientHomeScreenState();
}

class _CancerPatientHomeScreenState extends State<CancerPatientHomeScreen> {
  bool isRecieving = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          2 * size.width * 0.0555, 50, 2 * size.width * 0.0555, 0),
      child: Column(
        children: [
          Wrap(
            children: [
              Text(
                'Feeling lonely..? Try talking to a stranger just like you. Maybe it will make you feel better or maybe you can help someone by hearing to them :)',
                style:
                    primary.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 45,
          ),
          //call button
          GestureDetector(
              onTap: () {
                launchDialPad('24546542');
              },
              child: CallButton()),
          WidgetSpacing(
            top: 35,
          ),
          Wrap(
            children: [
              Text(
                'Note: It will be an anonymous call we dont store any of your call detail',
                style: primary.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recieve Calls',
                style:
                    primary.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              WidgetSpacing(
                right: 10,
              ),
              //toggle buttons
              buildToggleButton(),
            ],
          ),
          WidgetSpacing(
            top: 20,
          ),
          Wrap(
            children: [
              Text(
                'Kindly help us out to gather data on breast cancer by filling this survey.',
                style:
                    primary.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 20,
          ),
          //SurveyButton
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurveyScreen(),
                  ));
            },
            child: BaseContainer(
              title: 'Take Survey',
            ),
          )
        ],
      ),
    );
  }

  Container buildToggleButton() {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: ToggleButtons(
          disabledColor: Colors.transparent,
          fillColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          renderBorder: false,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          disabledBorderColor: Colors.transparent,
          borderWidth: 0,
          color: Colors.transparent,
          onPressed: (value) {
            isRecieving = !isRecieving;
            setState(() {});
          },
          borderColor: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          constraints: BoxConstraints(maxWidth: 40, maxHeight: 20),
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: isRecieving ? Colors.white : Colors.red,
                  borderRadius: BorderRadius.circular(40)),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: isRecieving ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(40)),
            )
          ],
          isSelected: [
            isRecieving,
            !isRecieving
          ]),
    );
  }
}
