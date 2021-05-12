library bottom_navy_bar;
//custom bottom nav bar

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavyBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;

  BottomNavyBar({
    Key key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 0,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    @required this.items,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
        decoration: BoxDecoration(color: bgColor, boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Color(0xff973961),
              blurRadius: 8,
            )
        ]),
        child: SafeArea(
            child: Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: items.map((item) {
                    var index = items.indexOf(item);
                    return GestureDetector(
                        onTap: () => onItemSelected(index),
                        child: _ItemWidget(
                          item: item,
                          iconSize: iconSize,
                          isSelected: index == selectedIndex,
                          backgroundColor: bgColor,
                          itemCornerRadius: itemCornerRadius,
                          animationDuration: animationDuration,
                        ));
                  }).toList(),
                ))));
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;

  const _ItemWidget(
      {Key key,
      @required this.item,
      @required this.isSelected,
      @required this.backgroundColor,
      @required this.animationDuration,
      @required this.itemCornerRadius,
      @required this.iconSize})
      : assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(animationDuration != null),
        assert(itemCornerRadius != null),
        assert(iconSize != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: isSelected ? 92 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        padding: EdgeInsets.only(left: 12),
        color: backgroundColor,
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(item.assetName,
                          height: 20,
                          width: 20,
                          color: isSelected
                              ? item.activeColor
                              : item.inactiveColor),
                    ),
                    isSelected
                        ? DefaultTextStyle.merge(
                            style: TextStyle(
                                color: item.activeColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'OS'),
                            child: item.title,
                          )
                        : SizedBox.shrink()
                  ])
            ]));
  }
}

class BottomNavyBarItem {
  final String assetName;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavyBarItem({
    @required this.assetName,
    @required this.title,
    this.activeColor = Colors.white,
    this.inactiveColor,
  }) {
    assert(assetName != null);
    assert(title != null);
  }
}
