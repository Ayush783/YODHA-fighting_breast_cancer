import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/widgets/podcast_base_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class PodcastScreen extends StatefulWidget {
  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Share Your Experience',
              style: title.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          WidgetSpacing(
            top: 30,
          ),
          PodcastBaseButton(
            icon: 'mic-white',
            size: 100,
          ),
          WidgetSpacing(
            top: 20,
          ),
          Wrap(
            children: [
              Text(
                'Start by telling something about yourself',
                style:
                    primary.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
          WidgetSpacing(
            top: 30,
          ),
          Text(
            'Survivor Podcast',
            style: title.copyWith(fontWeight: FontWeight.bold),
          ),
          WidgetSpacing(
            top: 40,
          ),
          buildPodcastPlayer(),
          WidgetSpacing(
            top: 45,
          ),
          Wrap(
            children: [
              Text(
                'Listen to the Survivors all around the world',
                style:
                    primary.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding buildPodcastPlayer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          PodcastBaseButton(
            icon: 'previous',
            size: 80,
          ),
          Spacer(
            flex: 1,
          ),
          PodcastBaseButton(
            icon: 'play',
            size: 80,
          ),
          Spacer(
            flex: 1,
          ),
          PodcastBaseButton(
            icon: 'forward',
            size: 80,
          ),
        ],
      ),
    );
  }
}
