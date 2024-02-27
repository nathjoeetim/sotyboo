import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/model/withdrawal_account.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/viewmodels/withdrawal_accounts_viewmodel.dart';

class AddWithdrawalAccountViewmodel extends ChangeNotifier {
  AddWithdrawalAccountViewmodel({
    required this.withdrawalAccountsViewmodel,
});

  final WithdrawalAccountsViewmodel withdrawalAccountsViewmodel;

   final List<String> _bankNameItems = [
    'GTB',
    'First Bank',
    'Zenith Bank',
    'Kuda Bank',
    'Wema Bank',
    'Fidelity Bank',
  ];

  final List<String> _countryItems = [
    'Nigeria',
    'Ghana',
    'South Africa',
    'USA',
    'India',
    'Italy',
  ];

  late GlobalKey<FormState> _formKey;
  late String _bankName, _accountNumber, _country, _accountName;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _bankName = _bankNameItems[0];
    _country = _countryItems[0];
    _accountNumber = '';
    _accountName = 'Alex Morgan';
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get bankName => _bankName;
  String get accountNumber => _accountNumber;
  String get accountName => _accountName;
  UnmodifiableListView<String> get bankNameItems =>
      UnmodifiableListView(_bankNameItems);
  UnmodifiableListView<String> get countryItems =>
      UnmodifiableListView(_countryItems);

  set accountNumber(value) => _accountNumber = value;

  setBankName({required String selectedBankName}) {
    if (_bankName == selectedBankName) {
      return;
    } else {
      _bankName = selectedBankName;
    }

    notifyListeners();
  }

  setCountry({required String selectedCountry}) {
    if (_country == selectedCountry) {
      return;
    } else {
      _country = selectedCountry;
    }

    notifyListeners();
  }

  addWithdrawalAccount() {
    final account = WithdrawalAccount(
      accountType: 'Bank Account',
      bankName: _bankName,
      accountNumber: _accountNumber,
      country: _country,
      accountName: _accountName,
    );

    withdrawalAccountsViewmodel.addWithdrawalAccount(account);
  }
}
