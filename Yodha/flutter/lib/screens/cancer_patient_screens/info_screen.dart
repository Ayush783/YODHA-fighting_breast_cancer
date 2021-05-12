import 'package:flutter/material.dart';
import 'package:ne_proj/screens/cancer_patient_screens/therapy_detail_screen.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/spacing.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TherapyDetailScreen(
                      heading: 'Chemotherapy',
                    ),
                  ));
            },
            child: BaseContainer(
              title: 'Chemotherapy',
            ),
          ),
          WidgetSpacing(
            top: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TherapyDetailScreen(
                      heading: 'Surgery',
                    ),
                  ));
            },
            child: BaseContainer(
              title: 'Surgery',
            ),
          ),
          WidgetSpacing(
            top: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TherapyDetailScreen(
                      heading: 'Radiation Therapy',
                    ),
                  ));
            },
            child: BaseContainer(
              title: 'Radiation Therapy',
            ),
          ),
          WidgetSpacing(
            top: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TherapyDetailScreen(
                      heading: 'Hormonal Therapy',
                    ),
                  ));
            },
            child: BaseContainer(
              title: 'Hormonal Therapy',
            ),
          ),
          WidgetSpacing(
            top: 30,
          ),
        ],
      ),
    );
  }
}
