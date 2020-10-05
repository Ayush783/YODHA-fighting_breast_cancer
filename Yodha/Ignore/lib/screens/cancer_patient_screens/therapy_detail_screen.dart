import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/data.dart';
import 'package:ne_proj/screens/cancer_patient_screens/faq_screen.dart';
import 'package:ne_proj/services/launch_urls.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/call_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class TherapyDetailScreen extends StatefulWidget {
  final String heading;

  const TherapyDetailScreen({Key key, this.heading}) : super(key: key);

  @override
  _TherapyDetailScreenState createState() => _TherapyDetailScreenState();
}

class _TherapyDetailScreenState extends State<TherapyDetailScreen> {
  String headline, sideEffects;
  @override
  void initState() {
    super.initState();
    for (Map data in therapyData) {
      if (data["title"] == widget.heading) {
        headline = data["headline"];
        sideEffects = data["sideEffects"];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.heading,
                  style: title.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              WidgetSpacing(
                top: 20,
              ),
              Wrap(
                children: [
                  Text(
                    headline,
                    style: primary.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              WidgetSpacing(
                top: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Side Effects',
                  style: title,
                ),
              ),
              WidgetSpacing(
                top: 20,
              ),
              Wrap(
                children: [
                  Text(
                    sideEffects,
                    style: primary.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              WidgetSpacing(
                top: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FAQScreen(
                          faq: chemoFAQ,
                        ),
                      ));
                },
                child: BaseContainer(
                  title: 'FAQ\'s regarding ${widget.heading}',
                ),
              ),
              WidgetSpacing(
                top: 20,
              ),
              Wrap(
                children: [
                  Text(
                    'You can also connect to our doctors to know more about Therapies for breast cancer by tapping on the call button',
                    style: primary.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              WidgetSpacing(
                top: 20,
              ),
              GestureDetector(
                  onTap: () {
                    launchDialPad('12443436');
                  },
                  child: CallButton()),
              WidgetSpacing(
                top: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
