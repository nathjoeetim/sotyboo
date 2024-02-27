import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

enum SearchTab { all, competitions, teams, players }

class SearchViewmodel extends ChangeNotifier {
  SearchTab _selectedTab = SearchTab.all;

  List<SearchTab> tabs = SearchTab.values;
  SearchTab get selectedTab => _selectedTab;

  setSelectedTab({required String searchTabName}) {
    for (SearchTab value in SearchTab.values) {
      if (value.name == searchTabName) {
        log('TABTYPE  --->  $searchTabName');
        log('VALUE  --->  ${value.name}');

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
