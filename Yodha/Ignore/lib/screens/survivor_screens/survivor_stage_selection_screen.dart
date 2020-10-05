import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/next_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../../const.dart';
import 'SUrvivor_dashboard.dart';

class SurvivorStageSelectionScreen extends StatefulWidget {
  @override
  _SurvivorStageSelectionScreenState createState() =>
      _SurvivorStageSelectionScreenState();
}

class _SurvivorStageSelectionScreenState
    extends State<SurvivorStageSelectionScreen> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.0555, 40, size.width * 0.0555, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLogo(),
            WidgetSpacing(
              top: 20,
            ),
            Text(
              'What was your breast cancer stage and last time you went to diagnose.',
              style: primary,
              textAlign: TextAlign.center,
            ),
            WidgetSpacing(
              top: 30,
            ),
            //drop down to select stage
            buildSelectStageDropDown(),
            Container(
              height: 2,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
            WidgetSpacing(
              top: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: BaseContainer(
                title: 'Pick Date',
              ),
            ),
            WidgetSpacing(
              top: 50,
            ),
            //next button
            NextButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurvivorDashboard(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSelectStageDropDown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.0),
      child: DropdownButton(
          dropdownColor: Color(0xff973961),
          style: primary.copyWith(fontSize: 18),
          underline: Container(),
          icon: SvgPicture.asset(
            'icons/drop.svg',
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          isExpanded: true,
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("Stage 0"),
              value: 0,
            ),
            DropdownMenuItem(
              child: Text("Stage 1"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Stage 2"),
              value: 2,
            ),
            DropdownMenuItem(child: Text("Stage 3"), value: 3),
            DropdownMenuItem(child: Text("Stage 4"), value: 4)
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }
}
