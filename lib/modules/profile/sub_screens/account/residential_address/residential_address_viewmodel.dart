import 'dart:collection';

import 'package:flutter/material.dart';

class ResidentialAddressViewmodel extends ChangeNotifier {
  final List<String> _countryItems = [
    'Nigeria',
    'Ghana',
    'South Africa',
    'USA',
    'India',
    'Italy',
  ];

  final List<String> _stateItems = [
    'Edo',
    'Lagos',
    'Delta',
    'Rivers',
    'Kano',
    'Katsina',
  ];

  final List<String> _cityItems = [
    'Warri',
    'Benin',
    'Port Harcourt',
    'Asaba',
    'Auchi',
  ];

  late GlobalKey<FormState> _formKey;
  late String _country, _address, _state, _city, _postCode, _password;

  late bool _isPasswordObscure;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _country = _countryItems[0];
    _city = _cityItems[0];
    _state = _stateItems[0];

    _isPasswordObscure = true;

    _isPasswordValidated = false;

    _isCompleted = false;
  }

  UnmodifiableListView<String> get countryItems =>
      UnmodifiableListView(_countryItems);
  UnmodifiableListView<String> get stateItems =>
      UnmodifiableListView(_stateItems);
  UnmodifiableListView<String> get cityItems =>
      UnmodifiableListView(_cityItems);

  GlobalKey<FormState> get formKey => _formKey;

  String get country => _country;
  String get address => _address;
  String get state => _state;
  String get city => _city;
  String get postCode => _postCode;
  String get password => _password;

  bool get isPasswordObscure => _isPasswordObscure;

  bool get isCompleted => _isCompleted;

  set address(value) => _address = value;
  set postCode(value) => _postCode = value;
  set password(value) => _password = value;
  set isCompleted(value) => _isCompleted = value;

  set isPasswordValidated(value) => _isPasswordValidated = value;

  setCountry({required String selectedCountry}) {
    if (_country == selectedCountry) {
      return;
    } else {
      _country = selectedCountry;
    }

    notifyListeners();
  }

  setCity({required String selectedCity}) {
    if (_city == selectedCity) {
      return;
    } else {
      _city = selectedCity;
    }

    notifyListeners();
  }

  setState({required String selectedState}) {
    if (_state == selectedState) {
      return;
    } else {
      _state = selectedState;
    }

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
