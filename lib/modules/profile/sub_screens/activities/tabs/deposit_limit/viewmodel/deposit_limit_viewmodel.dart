import 'package:flutter/cupertino.dart';

class DepositLimitViewmodel extends ChangeNotifier {
  late double _currentPosition;

  initialize() {
    resetPosition();
    initializeLimits();
  }

  double get currentPosition => _currentPosition;

  toMainPage() {
    _currentPosition = 0;
    notifyListeners();
  }

  toUpdatePage() {
    _currentPosition = 1;
    notifyListeners();
  }

  resetPosition() {
    _currentPosition = 0;
  }

  late GlobalKey<FormState> _formKey;

  String dayLimit = '';
  String weekLimit = '';
  String monthLimit = '';
  String password = '';
  late bool _isPasswordObscure;
  //late bool _isCompleted;

  //IS_VALIDATED
  late bool _isPasswordValidated;

  initializeLimits() {
    _formKey = GlobalKey<FormState>();

    _isPasswordObscure = true;
    _isPasswordValidated = false;
    //_isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  bool get isPasswordObscure => _isPasswordObscure;
  //bool get isCompleted => _isCompleted;

  //set isCompleted(value) => _isCompleted = value;
  set isPasswordValidated(value) => _isPasswordValidated = value;

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  /*void updateButton() {
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
