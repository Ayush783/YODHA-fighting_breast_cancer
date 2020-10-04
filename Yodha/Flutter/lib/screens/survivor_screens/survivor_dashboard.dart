import 'package:flutter/material.dart';
import 'package:ne_proj/screens/survivor_screens/podcast_screen.dart';
import 'package:ne_proj/screens/survivor_screens/survivor_home_screen.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/bottom_nav_bar.dart';

import '../../const.dart';
import '../events_screen.dart';

class SurvivorDashboard extends StatefulWidget {
  @override
  _SurvivorDashboardState createState() => _SurvivorDashboardState();
}

class _SurvivorDashboardState extends State<SurvivorDashboard> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    PodcastScreen(),
    SurvivorhomeScreen(),
    EventsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              assetName: 'icons/mic-pink.svg',
              title: Text(
                'Podcast',
                style: bottomnavybarstyle,
              ),
              activeColor: Color(0xff973961),
              inactiveColor: Color(0xff973961)),
          BottomNavyBarItem(
              assetName: 'icons/home.svg',
              title: Text(
                'Home',
                style: bottomnavybarstyle,
              ),
              activeColor: Color(0xff973961),
              inactiveColor: Color(0xff973961)),
          BottomNavyBarItem(
              assetName: 'icons/events.svg',
              title: Text(
                'Events',
                style: bottomnavybarstyle,
              ),
              activeColor: Color(0xff973961),
              inactiveColor: Color(0xff973961)),
        ],
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
      body: screens[_selectedIndex],
    );
  }
}
