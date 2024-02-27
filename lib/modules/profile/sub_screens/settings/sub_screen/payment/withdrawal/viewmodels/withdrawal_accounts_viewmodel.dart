import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/model/withdrawal_account.dart';

class WithdrawalAccountsViewmodel extends ChangeNotifier {

  final List<WithdrawalAccount> _withdrawalAccounts = [
    WithdrawalAccount(
      accountType: 'Bank Account',
      bankName: 'Kuda Bank',
      accountNumber: '2456786789',
      country: 'Nigeria',
    ),
    WithdrawalAccount(
      accountType: 'Online Account',
      bankName: 'Paypal',
      email: 'uk****@gmail.com',
    ),
  ];

  late WithdrawalAccount _selectedAccount;

  initialize() {
    _selectedAccount = withdrawalAccounts[0];
  }

  UnmodifiableListView<WithdrawalAccount> get withdrawalAccounts =>
      UnmodifiableListView(_withdrawalAccounts);
  WithdrawalAccount get selectedAccount => _selectedAccount;

  set selectedAccount(value) {
    _selectedAccount = value;
    notifyListeners();
  }

  addWithdrawalAccount(WithdrawalAccount withdrawalAccount) {
    _withdrawalAccounts.add(withdrawalAccount);
    notifyListeners();
  }
}
