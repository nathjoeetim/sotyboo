import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

enum MyActivitiesTab {
  week,
  month,
  year,
}

extension MyActivitiesTabExtension on MyActivitiesTab {
  String get value {
    switch (this) {
      case MyActivitiesTab.week:
        return '7 Days';
      case MyActivitiesTab.month:
        return '1 Month';
      case MyActivitiesTab.year:
        return '1 year';
    }
  }
}

class MyActivitiesViewmodel extends ChangeNotifier {
  MyActivitiesTab _selectedTab = MyActivitiesTab.week;

  List<MyActivitiesTab> tabs = MyActivitiesTab.values;
  MyActivitiesTab get selectedTab => _selectedTab;

  setSelectedTab({required String statsTabName}) {
    for (MyActivitiesTab value in MyActivitiesTab.values) {
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
