import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/services/launch_urls.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/call_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'Medium',
                style: TextStyle(
                    fontFamily: 'Sen',
                    fontSize: 50,
                    color: Color(0xffFEF200),
                    fontWeight: FontWeight.bold),
              ),
            ),
            WidgetSpacing(
              top: 40,
            ),
            Text(
              'You’re at a medium risk of having breast cancer we would suggest you talk to our expert about your concerns by clicking on the call button',
              style: primary.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            WidgetSpacing(
              top: 35,
            ),
            Text(
              'Note: These results does’nt actually mean that you have breast cancer',
              style: primary.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            WidgetSpacing(
              top: 35,
            ),
            //call button
            GestureDetector(
                onTap: () {
                  launchDialPad('453456547');
                },
                child: CallButton()),
            WidgetSpacing(
              top: 60,
            ),
            GestureDetector(
              onTap: () {
                launchURL('https://www.cancer.org/cancer/breast-cancer.html');
              },
              child: BaseContainer(
                title: 'Know more about Breast Cancer',
              ),
            )
          ],
        ),
      ),
    );
  }
}
