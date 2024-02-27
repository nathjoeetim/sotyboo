import 'package:flutter/cupertino.dart';

import '../../club_info/tabs/matches/components/match_tile.dart';

class FavouriteViewmodel extends ChangeNotifier {
  MatchesTab _selectedTab = MatchesTab.fixtures;

  MatchesTab get selectedTab => _selectedTab;
  List<MatchesTab> tabs = MatchesTab.values;

  void initialize() {
    _selectedTab = MatchesTab.fixtures;
  }

  setSelectedTab({required String matchesTabName}) {
    for (MatchesTab value in MatchesTab.values) {
      if (value.name == matchesTabName) {
        //log('TABTYPE  --->  $tabTypeName');
        //log('VALUE  --->  ${value.name}');

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
