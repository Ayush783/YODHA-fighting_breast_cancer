import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ne_proj/screens/cancer_patient_screens/stage_selection_screen.dart';
import 'package:ne_proj/screens/category_cscreen.dart';
import 'package:ne_proj/screens/non_cancer_patient_screens/symptom_ques_screen.dart';
import 'package:ne_proj/screens/survivor_screens/survivor_stage_selection_screen.dart';
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
            builder: (context) => CategoryScreen(
              email: event.email,
            ),
          ));
    }

    if (event is UpdateUserStatus) {
      yield FirebaseLoading();
      await api.updateUserStatus(event.email, event.status);
      yield FirebaseInitial();
      if (event.status == 'none')
        Navigator.push(
            event.context,
            MaterialPageRoute(
              builder: (context) => QuestionScreen(
                email: event.email,
              ),
            ));
      if (event.status == 'patient')
        Navigator.push(
            event.context,
            MaterialPageRoute(
              builder: (context) => SelectStage(
                email: event.email,
              ),
            ));
      if (event.status == 'survivor')
        Navigator.push(
            event.context,
            MaterialPageRoute(
              builder: (context) => SurvivorStageSelectionScreen(
                email: event.email,
              ),
            ));
    }
  }
}
