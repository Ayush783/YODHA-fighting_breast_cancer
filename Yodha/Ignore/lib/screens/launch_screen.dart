import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:ne_proj/bloc/firebase_bloc.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/next_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  // ignore: close_sinks
  FirebaseBloc bloc = FirebaseBloc();
  bool isSelected = false;
  String email;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildWidgets(size),
    );
  }

  Padding buildWidgets(Size size) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          2 * size.width * 0.0555, 100, 2 * size.width * 0.0555, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //app logo
            AppLogo(),
            WidgetSpacing(
              top: 40,
            ),
            //email textfield
            buildEmailField(),
            Container(
              height: 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
            WidgetSpacing(
              top: 100,
            ),
            //checkbox field
            buildCheckbox(),
            WidgetSpacing(top: 40),
            BlocBuilder<FirebaseBloc, FirebaseState>(
              cubit: bloc,
              builder: (context, state) {
                if (state is FirebaseInitial) {
                  return NextButton(onTap: () {
                    bloc.add(RegisterUserWithEmail(email, isSelected, context));
                  });
                } else {
                  return Center(
                      child: Lottie.asset('animations/loaading.json',
                          height: 30, width: 30));
                }
              },
            ),
            //Next Button
          ],
        ),
      ),
    );
  }

  Row buildCheckbox() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white)),
            child: Center(
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 18.0,
                      color: Colors.white,
                    )
                  : Text(''),
            ),
          ),
        ),
        WidgetSpacing(
          right: 25,
        ),
        Container(
          width: 220,
          child: Text(
            "Select this if you want us to send articles/stories about breast cancer",
            style: primary.copyWith(fontSize: 14),
          ),
        )
      ],
    );
  }

  Padding buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: (value) {
          email = value;
        },
        style: primary.copyWith(fontSize: 16),
        decoration: InputDecoration(
            fillColor: Colors.red,
            labelText: 'Enter Email',
            labelStyle: primary.copyWith(fontSize: 14),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            icon: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                'icons/@.svg',
                height: 14,
                width: 14,
              ),
            )),
      ),
    );
  }
}
