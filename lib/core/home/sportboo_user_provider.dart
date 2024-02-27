import 'package:flutter/material.dart';

import '../../models/sportboo_user.dart';

class SportbooUserProvider extends ChangeNotifier {

  SportbooUser? _sportbooUser;

  // Getter method
  SportbooUser? get sportbooUser {
    return _sportbooUser;
  }

  // Setter method
  set sportbooUser(SportbooUser? value) {
      _sportbooUser = value;
      notifyListeners();
  }

  void updateField(String value) {}

}