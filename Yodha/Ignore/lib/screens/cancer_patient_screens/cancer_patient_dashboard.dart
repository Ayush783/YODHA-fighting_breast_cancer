import 'package:flutter/material.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/screens/cancer_patient_screens/stories_screen.dart';
import 'package:ne_proj/widgets/app_bar.dart';
import 'package:ne_proj/widgets/bottom_nav_bar.dart';

import '../events_screen.dart';
import 'cancer_patient_home_screen.dart';
import 'info_screen.dart';

class CancerPatientDashBoard extends StatefulWidget {
  @override
  _CancerPatientDashBoardState createState() => _CancerPatientDashBoardState();
}

class _CancerPatientDashBoardState extends State<CancerPatientDashBoard> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    EventsScreen(),
    InfoScreen(),
    CancerPatientHomeScreen(),
    StoriesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              assetName: 'icons/events.svg',
              title: Text(
                'Events',
                style: bottomnavybarstyle,
              ),
              activeColor: Color(0xff973961),
              inactiveColor: Color(0xff973961)),
          BottomNavyBarItem(
              assetName: 'icons/info.svg',
              title: Text(
                'Info',
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
              assetName: 'icons/quotes.svg',
              title: Text(
                'Stories',
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
