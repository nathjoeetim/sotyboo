import 'package:flutter/cupertino.dart';

class SecurityViewmodel extends ChangeNotifier {
  late bool _twoFAToggle, _biometricToggle, _enableScreenshotsToggle;

  initialize() {
    _twoFAToggle = false;
    _biometricToggle = false;
    _enableScreenshotsToggle = false;
  }

  bool get twoFAToggle => _twoFAToggle;
  bool get biometricToggle => _biometricToggle;
  bool get enableScreenShotsToggle => _enableScreenshotsToggle;

  set twoFAToggle(value) {
    _twoFAToggle = value;
    notifyListeners();
  }

  set biometricToggle(value) {
    _biometricToggle = value;
    notifyListeners();
  }

  set enableScreenshotsToggle(value) {
    _enableScreenshotsToggle = value;
    notifyListeners();
  }
}
