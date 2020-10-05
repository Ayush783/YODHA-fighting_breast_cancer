import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:ne_proj/utility.dart';
import '../bloc/firebase_bloc.dart';
import '../const.dart';
import '../widgets/app_logo.dart';
import '../widgets/next_button.dart';
import '../widgets/spacing.dart';

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
      padding: EdgeInsets.fromLTRB(2 * size.width * 0.0555,
          size.height * 0.1479, 2 * size.width * 0.0555, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //app logo
            AppLogo(),
            WidgetSpacing(
              top: size.height * 0.059171,
            ),
            //email textfield
            buildEmailField(size),
            Container(
              height: 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
            WidgetSpacing(top: size.height * 0.1479),
            //checkbox field
            buildCheckbox(size),
            WidgetSpacing(top: 40),
            //next button or loading animation
            BlocBuilder<FirebaseBloc, FirebaseState>(
              cubit: bloc,
              builder: (context, state) {
                if (state is FirebaseInitial) {
                  return NextButton(onTap: () {
                    bool a = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email ?? '');
                    print(email);
                    print(a);
                    if (a)
                      bloc.add(
                          RegisterUserWithEmail(email, isSelected, context));
                    else {
                      Utility.getSnackBar(context: context, text: 'adsfgh');
                    }
                  });
                } else {
                  return Container(
                    child: Center(
                        child: Lottie.asset('animations/loading.json',
                            height: size.height * 0.07395,
                            width: size.width * 0.13888)),
                  );
                }
              },
            ),
            WidgetSpacing(
              top: 10,
            )
          ],
        ),
      ),
    );
  }

  Row buildCheckbox(Size size) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            height: size.width * 0.0555,
            width: size.width * 0.0555,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white)),
            child: Center(
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: size.width * 0.05,
                      color: Colors.white,
                    )
                  : Text(''),
            ),
          ),
        ),
        WidgetSpacing(right: size.width * 0.069444),
        Container(
          width: size.width * 0.611111,
          child: Text(
            "Select this if you want us to send articles/stories about breast cancer",
            style: primary.copyWith(fontSize: 14),
          ),
        )
      ],
    );
  }

  Padding buildEmailField(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0555),
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
                height: size.width * 0.03888,
                width: size.width * 0.03888,
              ),
            )),
      ),
    );
  }
}
