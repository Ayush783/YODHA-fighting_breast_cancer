import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/screens/non_cancer_patient_screens/result_screen.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/next_button.dart';
import 'package:ne_proj/widgets/spacing.dart';
import 'package:ne_proj/widgets/yes_no_buttons.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int i = 0;
  bool isYes = false, isNo = false;
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
              top: 30,
            ),
            Container(
              width: 320,
              height: 110,
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    questions[i],
                    style: primary.copyWith(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            WidgetSpacing(
              top: 40,
            ),
            //yes no button
            YesNoButtons(isYes, isNo),
            WidgetSpacing(
              top: 100,
            ),
            //next button
            NextButton(
              onTap: () {
                if (i < questions.length - 1) {
                  i++;
                  setState(() {});
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(),
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
