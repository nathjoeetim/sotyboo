import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

enum StatsTab {
  match,
  firstHalf,
  secondHalf,
}

extension StatsTabExtension on StatsTab {
  String get value {
    switch (this) {
      case StatsTab.match:
        return 'Match';
      case StatsTab.firstHalf:
        return '1st Half';
      case StatsTab.secondHalf:
        return '2nd Half';
    }
  }
}

class StatsViewmodel extends ChangeNotifier {
  StatsTab _selectedTab = StatsTab.match;

  List<StatsTab> tabs = StatsTab.values;
  StatsTab get selectedTab => _selectedTab;

  setSelectedTab({required String statsTabName}) {
    for (StatsTab value in StatsTab.values) {
      if (value.value == statsTabName) {
        //log('TABTYPE  --->  $statsTabName');
        //log('VALUE  --->  ${value.value}');

        if (_selectedTab == value) {
          //If This option has already been set, then there's no need to set it again
          return;
        } else {
          _selectedTab = value;
        }
      }
    }

    notifyListeners();
  }
}
