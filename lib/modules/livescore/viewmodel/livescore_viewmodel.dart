import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/livescore/model/date.dart';

class LiveScoreViewmodel extends ChangeNotifier {
  LiveScoreViewmodel();

  late Date _selectedDate;

  final List<Date> _fixtureDates = [
    Date(
      day: 'MON',
      date: '23 SEP',
    ),
    Date(
      day: 'TUE',
      date: '29 SEP',
    ),
    Date(
      day: 'WED',
      date: '30 SEP',
    ),
    Date(
      day: 'TODAY',
      date: '01 OCT',
    ),
    Date(
      day: 'FRI',
      date: '02 OCT',
    ),
    Date(
      day: 'SAT',
      date: '03 OCT',
    ),
    Date(
      day: 'SUN',
      date: '04 OCT',
    ),
  ];

  Date get selectedDate => _selectedDate;
  UnmodifiableListView<Date> get fixtureDates =>
      UnmodifiableListView(_fixtureDates);
  int get datesCount => _fixtureDates.length;

  void instantiate() {
    //_selectedDate = Date(day: '', date: '');

    // Find the date with 'TODAY' in the fixture list
    Date todayDate = _fixtureDates.firstWhere(
      (date) => date.day == 'TODAY',
      orElse: () => Date(day: '', date: ''),
    );

    // Update the date values with today's date
    _selectedDate = Date(
      day: todayDate.day,
      date: todayDate.date,
    );

    //log(todayDate.day);
  }

  setSelectedDate({required index}) {
    if (isSelected(index: index)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      _selectedDate = fixtureDates[index];
    }

    notifyListeners();
  }

  bool isSelected({index}) {
    return selectedDate == fixtureDates[index] ? true : false;
  }
}
