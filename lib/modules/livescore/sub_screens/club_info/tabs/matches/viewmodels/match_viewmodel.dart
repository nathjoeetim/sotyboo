import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/match_tile.dart';

class MatchViewmodel extends ChangeNotifier {
  late Map<String, dynamic> _selectedLeague;

  final List<Map<String, dynamic>> _leagueItems = [
    {
      'icon': SvgPicture.asset('assets/svgs/global.svg'),
      'option': 'All competitions'
    },
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Premier League'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Community Shield'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'FA Cup'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'EPL Cup'},
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 21/22'
    },
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 20/22'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group G'},
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Semi-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Quarter-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Round of 16'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group A'},
    {'icon': Image.asset('assets/svgs/world.png'), 'option': 'Club Friendlies'},
  ];

  MatchesTab _selectedTab = MatchesTab.fixtures;

  Map<String, dynamic> get selectedLeague => _selectedLeague;
  MatchesTab get selectedTab => _selectedTab;
  UnmodifiableListView<Map<String, dynamic>> get leagueItems =>
      UnmodifiableListView(_leagueItems);
  List<MatchesTab> tabs = MatchesTab.values;

  void initialize() {
    _selectedLeague = _leagueItems[0];
    _selectedTab = MatchesTab.fixtures;
  }

  setSelectedLeague({required Map<String, dynamic> selectedLeague}) {
    if (isSelected(selectedLeague: selectedLeague)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      _selectedLeague = selectedLeague;
    }

    notifyListeners();
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

  bool isSelected({required Map<String, dynamic> selectedLeague}) {
    return _selectedLeague == selectedLeague;
  }
}
