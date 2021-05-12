import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/data.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/spacing.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faq;

  const FAQScreen({Key key, this.faq}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'FAQ\'s',
                style: title.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            WidgetSpacing(
              bottom: 20,
            ),
            Container(
              width: double.maxFinite,
              height: 510,
              child: ListView.builder(
                  itemCount: chemoFAQ.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              faq[index]["ques"],
                              style: primary.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          WidgetSpacing(
                            top: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              faq[index]["ans"],
                              style: primary.copyWith(fontSize: 16),
                            ),
                          ),
                          WidgetSpacing(
                            top: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
