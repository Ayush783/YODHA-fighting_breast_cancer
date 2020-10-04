import 'package:flutter/material.dart';
import 'package:ne_proj/data.dart';
import 'package:ne_proj/services/launch_urls.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/spacing.dart';

import '../const.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              'Upcoming Events',
              style: title.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          WidgetSpacing(
            bottom: 20,
          ),
          Container(
            width: double.maxFinite,
            height: 450,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Text(
                            events[index]["title"],
                            style: title.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      WidgetSpacing(
                        top: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            events[index]["date"],
                            style:
                                primary.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Notify Me',
                              style: primary.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Radio(
                              activeColor: Colors.white,
                              value: 1,
                              groupValue: 0,
                              onChanged: (value) {})
                        ],
                      ),
                      WidgetSpacing(
                        top: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          launchURL(events[index]["link"]);
                        },
                        child: BaseContainer(
                          title: 'Register',
                        ),
                      ),
                      WidgetSpacing(
                        top: 20,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      WidgetSpacing(
                        top: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
