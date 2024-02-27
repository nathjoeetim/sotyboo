import 'package:flutter/material.dart';

class ContactDetailsViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _phone, _email, _password;

  late bool _isPasswordObscure;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isPhoneValidated, _isEmailValidated, _isPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _isPasswordObscure = true;

    _isPhoneValidated = false;
    _isEmailValidated = false;
    _isPasswordValidated = false;

    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get phone => _phone;
  String get email => _email;
  String get password => _password;

  bool get isPasswordObscure => _isPasswordObscure;

  bool get isCompleted => _isCompleted;

  set phone(value) => _phone = value;
  set email(value) => _email = value;
  set password(value) => _password = value;
  set isCompleted(value) => _isCompleted = value;

  set isPhoneValidated(value) => _isPhoneValidated = value;
  set isEmailValidated(value) => _isEmailValidated = value;
  set isPasswordValidated(value) => _isPasswordValidated = value;

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void updateButton() {
    if (_isPhoneValidated && _isEmailValidated && _isPasswordValidated) {
      isCompleted = true;
    } else {
      isCompleted = false;
    }

    //Calls notify listener when the validating process is complete to prevent errors or interference
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
