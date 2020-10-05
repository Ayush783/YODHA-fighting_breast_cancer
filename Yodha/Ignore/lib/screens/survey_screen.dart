import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/data.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/spacing.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 540,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: surveyQues.length + 1,
                itemBuilder: (context, index) {
                  if (index < surveyQues.length) {
                    return Container(
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  surveyQues[index],
                                  style: primary.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          WidgetSpacing(
                            top: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              children: [
                                Text(
                                  'Yes',
                                  style: primary.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                WidgetSpacing(
                                  right: 10,
                                ),
                                Radio(
                                    value: 1,
                                    activeColor: Colors.white,
                                    groupValue: 0,
                                    onChanged: (value) {}),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'No',
                                  style: primary.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                WidgetSpacing(
                                  right: 10,
                                ),
                                Radio(
                                    value: 2,
                                    activeColor: Colors.white,
                                    groupValue: 0,
                                    onChanged: (value) {}),
                              ],
                            ),
                          ),
                          WidgetSpacing(
                            top: 20,
                          )
                        ],
                      ),
                    );
                  } else {
                    return GestureDetector(
                      child: BaseContainer(
                        title: 'Submit',
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
