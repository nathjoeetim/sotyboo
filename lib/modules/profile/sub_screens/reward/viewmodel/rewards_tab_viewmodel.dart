import 'dart:collection';

import 'package:flutter/foundation.dart';

class RewardsTabViewmodel extends ChangeNotifier {
  int _currentPosition = 0;

  final List<String> _labels = [
    'New Tasks',
    'Existing Tasks',
    'Rewards',
  ];

  initialize() {
    _currentPosition = 0;
  }

  int get currentPosition => _currentPosition;
  UnmodifiableListView<String> get labels => UnmodifiableListView(_labels);

  set currentPosition(value) {
    _currentPosition = value;
    notifyListeners();
  }
}
