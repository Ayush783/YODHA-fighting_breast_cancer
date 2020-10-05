import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ne_proj/screens/category_cscreen.dart';
import 'package:ne_proj/services/firebase_services.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial());

  FirebaseService api = FirebaseService();

  @override
  Stream<FirebaseState> mapEventToState(
    FirebaseEvent event,
  ) async* {
    yield FirebaseInitial();
    if (event is RegisterUserWithEmail) {
      yield FirebaseLoading();
      await api.addUser(event.email, event.value);
      yield FirebaseInitial();
      Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
          ));
    }

    if (event is UpdateUserStatus) {
      yield FirebaseLoading();
      await api.updateUserStatus(event.email, event.status);
      yield FirebaseLoaded();
    }
  }
}
