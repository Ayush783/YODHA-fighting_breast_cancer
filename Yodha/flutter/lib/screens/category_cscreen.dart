import 'package:flutter/material.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/base_container.dart';
import 'package:ne_proj/widgets/spacing.dart';

class CategoryScreen extends StatefulWidget {
  final String email;

  const CategoryScreen({Key key, this.email}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildOptions(size, context),
    );
  }

  Padding buildOptions(Size size, BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(size.width * 0.0555, 40, size.width * 0.0555, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogo(),
          WidgetSpacing(
            top: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: BaseContainer(
              title: 'I\'m not a breast cancer patient',
            ),
          ),
          WidgetSpacing(
            bottom: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: BaseContainer(
              title: 'I\'m a breast cancer patient',
            ),
          ),
          WidgetSpacing(
            bottom: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: BaseContainer(
              title: 'I\'m a breast cancer Survivor',
            ),
          ),
          WidgetSpacing(
            bottom: 90,
          ),
        ],
      ),
    );
  }
}
