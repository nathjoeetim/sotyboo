import 'dart:collection';

import 'package:flutter/cupertino.dart';

class PreferencesViewmodel extends ChangeNotifier {
  final List<String> _languageItems = [
    'English',
    'Spanish',
    'French',
    'Russian',
    'Portuguese',
    'Japanese',
  ];

  final List<String> _timeZoneItems = [
    'GMT-2',
    'GMT-1',
    'GMT-0',
    'GMT+1',
    'GMT+2',
    'GMT+3',
    'GMT+4',
    'GMT+5',
  ];

  final List<String> _oddsDisplayItems = [
    'Decimal',
    'Fractions',
  ];

  final List<String> _inactivityPeriodItems = [
    '1 minutes',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '20 minutes',
    '30 minutes',
  ];

  late GlobalKey<FormState> _formKey;
  late String _language, _timeZone, _oddsDisplay, _inactivityPeriod, _password;
  late bool _notificationToggle,
      _smsToggle,
      _emailToggle,
      _messagesToggle,
      _popUpsToggle;
  late bool _isPasswordObscure;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _language = _languageItems[0];
    _timeZone = _timeZoneItems[0];
    _oddsDisplay = _oddsDisplayItems[0];
    _inactivityPeriod = _inactivityPeriodItems[0];

    _notificationToggle = true;
    _smsToggle = false;
    _emailToggle = true;
    _messagesToggle = true;
    _popUpsToggle = false;

    _isPasswordObscure = true;
    _isPasswordValidated = false;

    _isCompleted = false;
  }

  UnmodifiableListView<String> get languageItems =>
      UnmodifiableListView(_languageItems);
  UnmodifiableListView<String> get timeZoneItems =>
      UnmodifiableListView(_timeZoneItems);
  UnmodifiableListView<String> get oddsDisplayItems =>
      UnmodifiableListView(_oddsDisplayItems);
  UnmodifiableListView<String> get inactivityPeriodItems =>
      UnmodifiableListView(_inactivityPeriodItems);

  GlobalKey<FormState> get formKey => _formKey;

  String get language => _language;
  String get timeZone => _timeZone;
  String get oddsDisplay => _oddsDisplay;
  String get inactivityPeriod => _inactivityPeriod;
  String get password => _password;

  bool get notificationToggle => _notificationToggle;
  bool get smsToggle => _smsToggle;
  bool get emailToggle => _emailToggle;
  bool get messagesToggle => _messagesToggle;
  bool get popUpsToggle => _popUpsToggle;

  bool get isPasswordObscure => _isPasswordObscure;

  bool get isCompleted => _isCompleted;

  set password(value) => _password = value;
  set isCompleted(value) => _isCompleted = value;

  set isPasswordValidated(value) => _isPasswordValidated = value;

  setLanguage({required String selectedLanguage}) {
    if (_language == selectedLanguage) {
      return;
    } else {
      _language = selectedLanguage;
    }

    notifyListeners();
  }

  setTimeZone({required String selectedTimeZone}) {
    if (_oddsDisplay == selectedTimeZone) {
      return;
    } else {
      _oddsDisplay = selectedTimeZone;
    }

    notifyListeners();
  }

  setOddsDisplay({required String selectedOddsDisplay}) {
    if (_timeZone == selectedOddsDisplay) {
      return;
    } else {
      _timeZone = selectedOddsDisplay;
    }

    notifyListeners();
  }

  setInactivityPeriod({required String selectedInactivityPeriod}) {
    if (_inactivityPeriod == selectedInactivityPeriod) {
      return;
    } else {
      _inactivityPeriod = selectedInactivityPeriod;
    }

    notifyListeners();
  }

  set notificationToggle(value) {
    _notificationToggle = value;
    notifyListeners();
  }

  set smsToggle(value) {
    _smsToggle = value;
    notifyListeners();
  }

  set emailToggle(value) {
    _emailToggle = value;
    notifyListeners();
  }

  set messagesToggle(value) {
    _messagesToggle = value;
    notifyListeners();
  }

  set popUpsToggle(value) {
    _popUpsToggle = value;
    notifyListeners();
  }

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void updateButton() {
    if (_isPasswordValidated) {
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
