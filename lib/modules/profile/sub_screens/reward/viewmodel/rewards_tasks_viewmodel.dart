import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/models/tasks.dart';

class RewardsTasksViewmodel extends ChangeNotifier {
  late Tasks _selectedTask;

  final List<Tasks> _tasks = [
    Tasks(
      title: 'Sign Up',
      description: 'Create an account and get 500SPB Token.',
      icon: 'amico',
      amount: '500',
    ),
    Tasks(
      title: 'Onboarding',
      description: 'Complete account setup to receive 20SPB Token.',
      icon: 'amico',
      amount: '20',
    ),
    Tasks(
      title: 'Verification Up',
      description: 'Verify your account to receive 100SPB Token.',
      icon: 'shield',
      amount: '100',
    ),
    Tasks(
      title: 'Daily Login',
      description: 'Get 5SPB Token everytime you login to SiuuuSports.',
      icon: 'login',
      amount: '5',
    ),
    Tasks(
      title: 'Referral',
      description: 'Refer your friends and get 200SPB Token.',
      icon: 'amico',
      amount: '200',
    ),
    Tasks(
      title: 'Deposit',
      description: 'Fund your wallet and get 300SPB Token.',
      icon: 'deposit-tile',
      amount: '300',
    ),
    Tasks(
      title: 'P2P Betting',
      description: 'Get 50SPB Token for participating in p2p betting.',
      icon: 'p2p-tile',
      amount: '100',
    ),
    Tasks(
      title: 'Bookie',
      description: 'Create a bookie and receive 500SPB Token.',
      icon: 'bookie',
      amount: '50',
    ),
  ];

  Tasks get selectedTask => _selectedTask;
  UnmodifiableListView<Tasks> get tasks => UnmodifiableListView(_tasks);
  int get tasksCount => _tasks.length;

  void instantiate() {
    _selectedTask = Tasks(title: '', description: '', icon: '', amount: '');
  }

  setSelectedTask({required index}) {
    if (isSelected(index: index)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      _selectedTask = tasks[index];
    }

    //debugPrint(promos[index].label);
    notifyListeners();
  }

  bool isSelected({index}) {
    return selectedTask == tasks[index] ? true : false;
  }
}
