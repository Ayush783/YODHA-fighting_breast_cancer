import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/screens/cancer_patient_screens/cancer_patient_dashboard.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/next_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class SelectStage extends StatefulWidget {
  @override
  _SelectStageState createState() => _SelectStageState();
}

class _SelectStageState extends State<SelectStage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.0555, 40, size.width * 0.0555, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(),
              WidgetSpacing(
                top: 30,
              ),
              Text(
                'Please Select your breast cancer stage',
                style: primary,
                textAlign: TextAlign.center,
              ),
              WidgetSpacing(
                top: 50,
              ),
              //drop down to select stage
              buildSelectStageDropDown(),
              Container(
                height: 2,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
              ),
              WidgetSpacing(
                top: 25,
              ),
              //phone number text field
              buildPhoneNumberTextField(),
              Container(
                height: 2,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
              ),
              WidgetSpacing(top: 50),
              //Next Button
              NextButton(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CancerPatientDashBoard(),
                    ));
              })
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPhoneNumberTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.0),
      child: TextField(
        style: primary.copyWith(fontSize: 16),
        decoration: InputDecoration(
            fillColor: Colors.red,
            labelText: 'Enter Phone Number',
            labelStyle: primary.copyWith(fontSize: 14),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            icon: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                'icons/call.svg',
                height: 14,
                width: 14,
              ),
            )),
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
