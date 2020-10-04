import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/call_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class SurvivorhomeScreen extends StatefulWidget {
  @override
  _SurvivorhomeScreenState createState() => _SurvivorhomeScreenState();
}

class _SurvivorhomeScreenState extends State<SurvivorhomeScreen> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Column(
        children: [
          //mammogram notification panel
          buildNotificationPanel(),
          WidgetSpacing(
            top: 20,
          ),
          Wrap(
            children: [
              Text(
                'Do you want some help?.. Talk to our experts to get more guidance by clicking on the call button below.',
                style:
                    primary.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 20,
          ),
          //call button
          CallButton(),
          WidgetSpacing(
            top: 25,
          ),
          BaseContainer(
            title: 'Life after Breast Cancer',
          ),
          WidgetSpacing(
            top: 20,
          ),
          Wrap(
            children: [
              Text(
                'Kindly help us out to gather data on breast cancer by filling this survey',
                style:
                    primary.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 20,
          ), //SurveyButton
          BaseContainer(
            title: 'Take Survey',
          )
        ],
      ),
    );
  }

  Material buildNotificationPanel() {
    return Material(
      elevation: 4,
      color: Color(0xff973961),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Column(
          children: [
            Text(
              'Mammogram Notification',
              style:
                  primary.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            WidgetSpacing(
              top: 10,
            ),
            Row(
              children: [
                Text(
                  'Once Every 6 months',
                  style: primary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 1,
                ),
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.white,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Once in a year',
                  style: primary.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 1,
                ),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.white,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
