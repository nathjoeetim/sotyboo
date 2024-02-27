import 'package:flutter/widgets.dart';

class ChangePasswordViewmodel extends ChangeNotifier{
  late GlobalKey<FormState> _formKey;
  late String _oldPassword, _newPassword, _confirmPassword;

  late bool _isOldPasswordObscure;
  late bool _isNewPasswordObscure;
  late bool _isConfirmPasswordObscure;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isOldPasswordValidated;
  late bool _isNewPasswordValidated;
  late bool _isConfirmPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _isOldPasswordObscure = true;
    _isNewPasswordObscure = true;
    _isConfirmPasswordObscure = true;

    _isOldPasswordValidated = false;
    _isNewPasswordValidated = false;
    _isConfirmPasswordValidated = false;

    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;

  String get oldPassword => _oldPassword;
  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  bool get isOldPasswordObscure => _isOldPasswordObscure;
  bool get isNewPasswordObscure => _isNewPasswordObscure;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  bool get isCompleted => _isCompleted;

  set oldPassword(value) => _oldPassword = value;
  set newPassword(value) => _newPassword = value;
  set confirmPassword(value) => _confirmPassword = value;
  set isCompleted(value) => _isCompleted = value;

  set isOldPasswordValidated(value) => _isOldPasswordValidated = value;
  set isNewPasswordValidated(value) => _isNewPasswordValidated = value;
  set isConfirmPasswordValidated(value) => _isConfirmPasswordValidated = value;

  void toggleOldPasswordObscure() {
    _isOldPasswordObscure = !_isOldPasswordObscure;
    notifyListeners();
  }

  void toggleNewPasswordObscure() {
    _isNewPasswordObscure = !_isNewPasswordObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordObscure() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  void updateButton() {
    if (_isOldPasswordValidated && _isNewPasswordValidated && _isConfirmPasswordValidated) {
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