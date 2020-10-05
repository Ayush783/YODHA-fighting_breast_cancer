import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ne_proj/bloc/firebase_bloc.dart';
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
  // ignore: close_sinks
  FirebaseBloc bloc = FirebaseBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<FirebaseBloc, FirebaseState>(
        cubit: bloc,
        builder: (context, state) {
          if (state is FirebaseInitial) {
            return buildOptions(size, context);
          } else {
            return Container(
              child: Center(
                  child: Lottie.asset('animations/loading.json',
                      height: 100, width: 100)),
            );
          }
        },
      ),
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
            onTap: () {
              bloc.add(UpdateUserStatus(widget.email, 'none', context));
            },
            child: BaseContainer(
              title: 'I\'m not a breast cancer patient',
            ),
          ),
          WidgetSpacing(
            bottom: 30,
          ),
          GestureDetector(
            onTap: () {
              bloc.add(UpdateUserStatus(widget.email, 'patient', context));
            },
            child: BaseContainer(
              title: 'I\'m a breast cancer patient',
            ),
          ),
          WidgetSpacing(
            bottom: 30,
          ),
          GestureDetector(
            onTap: () {
              bloc.add(UpdateUserStatus(widget.email, 'survivor', context));
            },
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
