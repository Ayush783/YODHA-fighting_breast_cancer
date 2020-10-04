import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/data.dart';
import 'package:ne_proj/services/launch_urls.dart';
import 'package:ne_proj/widgets/spacing.dart';

class StoriesScreen extends StatefulWidget {
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return Container(
          height: 540,
          width: 360,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/${index + 1}.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 95),
            child: Column(
              children: [
                Wrap(
                  children: [
                    Text(
                      stories[index]["stories"],
                      style: title.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                WidgetSpacing(
                  top: 60,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: [
                      Text(
                        "-${stories[index]["name"]}",
                        style: title.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                WidgetSpacing(
                  top: 40,
                ),
                GestureDetector(
                  onTap: () {
                    launchURL(stories[index]["link"]);
                  },
                  child: Text(
                    'Read full story here',
                    style: title.copyWith(
                        fontSize: 18, decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
