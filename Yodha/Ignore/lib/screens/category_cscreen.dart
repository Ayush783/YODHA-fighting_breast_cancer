import 'package:flutter/material.dart';
import 'package:ne_proj/screens/cancer_patient_screens/stage_selection_screen.dart';
import 'package:ne_proj/screens/non_cancer_patient_screens/symptom_ques_screen.dart';
import 'package:ne_proj/screens/survivor_screens/survivor_stage_selection_screen.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/spacing.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ));
              },
              child: BaseContainer(
                title: 'I\'m not a breast cancer patient',
              ),
            ),
            WidgetSpacing(
              bottom: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectStage(),
                    ));
              },
              child: BaseContainer(
                title: 'I\'m a breast cancer patient',
              ),
            ),
            WidgetSpacing(
              bottom: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurvivorStageSelectionScreen(),
                    ));
              },
              child: BaseContainer(
                title: 'I\'m a breast cancer Survivor',
              ),
            ),
            WidgetSpacing(
              bottom: 90,
            ),
          ],
        ),
      ),
    );
  }
}
