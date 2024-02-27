import 'dart:collection';

import 'package:flutter/material.dart';

class TimeoutViewmodel extends ChangeNotifier {
  final List<String> _timeoutPeriodItems = [
    '30 Minutes',
    '1 Hour',
    '3 Hours',
    '6 Hours',
    '9 Hours',
    '24 Hours',
  ];

  late GlobalKey<FormState> _formKey;

  late String _timeoutPeriod;
  String password = '';
  late bool _isPasswordObscure;
  //late bool _isCompleted;

  //IS_VALIDATED
  late bool _isPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _timeoutPeriod = _timeoutPeriodItems[0];
    _isPasswordObscure = true;
    _isPasswordValidated = false;
    // _isCompleted = false;
  }

  UnmodifiableListView<String> get timeoutPeriodItems =>
      UnmodifiableListView(_timeoutPeriodItems);

  GlobalKey<FormState> get formKey => _formKey;
  String get timeoutPeriod => _timeoutPeriod;
  bool get isPasswordObscure => _isPasswordObscure;
  //bool get isCompleted => _isCompleted;

  //set isCompleted(value) => _isCompleted = value;
  set isPasswordValidated(value) => _isPasswordValidated = value;

  set timeoutPeriod(value) {
    if (_timeoutPeriod == value) {
      return;
    } else {
      _timeoutPeriod = value;
    }

    notifyListeners();
  }

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

/*  void updateButton() {
    if (_isPasswordValidated) {
      isCompleted = true;
    } else {
      isCompleted = false;
    }

    //Calls notify listener when the validating process is complete to prevent errors or interference
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }*/
}
