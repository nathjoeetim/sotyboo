import 'dart:developer';

import 'package:credit_card_type_detector/models.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/model/deposit_card.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/viewmodels/deposit_cards_viewmodel.dart';
//import 'package:sportboo/shared/utils/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';

class AddDepositCardViewmodel extends ChangeNotifier {
  AddDepositCardViewmodel({
    required this.depositCardsViewmodel,
  });

  final DepositCardsViewmodel depositCardsViewmodel;

  /* late GlobalKey<FormState> _formKey;

  String cardType = '';
  String cardBrand = '';
  String cardName = '';
  String cardNumber = '';
  String expiryMonth = '';
  String expiryYear = '';
  String securityCode = '';

  initialize() {
    _formKey = GlobalKey<FormState>();
  }

  GlobalKey<FormState> get formKey => _formKey;*/

  late GlobalKey<FormState> _formKey;

  String _cardName = '';
  String _cardNumber = '';
  String _expiryDate = '';
  String _expiryMonth = '';
  String _expiryYear = '';
  String _cvv = '';

  late CreditCardType _cardType;
  late final CreditCardValidator _ccValidator = CreditCardValidator();
  //late bool _isCompleted;

  initialize() {
    _formKey = GlobalKey<FormState>();
    //_cardType = CreditCardType();
    //_isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get cardName => _cardName;
  String get cardNumber => _cardNumber;
  String get expiryDate => _expiryDate;
  String get expiryMonth => _expiryMonth; //The 2 digit month of the expiry date
  String get expiryYear => _expiryYear; //The 4 digit year of the expiry date
  String get cvv => _cvv;
  CreditCardType get cardType => _cardType;
  //bool get isCompleted => _isCompleted;

  set cardName(value) => _cardName = value;

  set cardNumber(value) {
    _cardNumber = value;

    cardType = value;

    log('CARD NUMBER   $value');
    try {
      String newNumber =
          value.replaceAll(" ", ""); // Remove spaces from card number

      log('NEW CARD NUMBER   $newNumber');
    } catch (e) {
      debugPrint('Incomplete');
    }
  }

  set expiryDate(value) {
    _expiryDate = value;

    try {
      final dateList = _expiryDate.split("/");

      String stringMonth = dateList[0];
      String stringYear = dateList[1];

      if (stringMonth.length == 1) {
        stringMonth = '0$stringMonth';
      }

      int year = toFourDigitYear(stringYear);
      stringYear = year.toString();

      _expiryMonth = stringMonth;
      _expiryYear = stringYear;

      //debugPrint('MONTH   $month');
      //debugPrint('YEAR   $year');
    } catch (e) {
      debugPrint('Incomplete');
    }
  }

  set cvv(value) => _cvv = value;
  set cardType(cardNumber) =>
      _cardType = _ccValidator.validateCCNum(cardNumber).ccType;
  // set isCompleted(value) => _isCompleted = value;

  String? cardNameValidator({required String? cardNameValue}) {
    if (cardNameValue!.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  String? cardNumberValidator({required String? cardNumberValue}) {
    String message =
        _ccValidator.validateCCNum(cardNumberValue.toString()).message;

    if (message.isNotEmpty) {
      return message;
    }

    if (cardType != CreditCardType.mastercard() &&
        cardType != CreditCardType.visa()) {
      return 'Only mastercard and visa is supported';
    }

    return null;
  }

  String? expiryDateValidator({required String? expiryDateValue}) {
    if (expiryDateValue == null || expiryDateValue.isEmpty) {
      return 'No date given';
    }

    if (expiryDateValue.length < 5) {
      return 'Date incomplete';
    }

    final components = expiryDateValue.split("/");

    if (components.length == 2) {
      final month = int.tryParse(components[0]);
      final year = int.tryParse(components[1]);

      if (month != null && year != null) {
        if (isExpired(month: month, year: toFourDigitYear(year.toString()))) {
          return 'Card Expired';
        } else {
          return null;
        }
      }
    }
    return 'Wrong date';
  }

  String? cvvValidator({required String? cvvValue}) {
    if (cvvValue!.isEmpty) {
      //return 'No security code given';
      return 'No cvv given';
    }

    if (cvvValue.length < 3) {
      return 'Too short';
    }
    return null;
  }

  /* void updateAddToMyCardsButton() {
    isCompleted = formKey.currentState!.validate() ? true : false;
    notifyListeners();
  }*/

  addDepositCard() {
    final account = DepositCard(
      cardCategory: 'Debit Card',
      cardType: _cardType.type,
      cardName: _cardName,
      cardNumber: _cardNumber,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
      securityCode: _cvv,
    );

    depositCardsViewmodel.addDepositCard(account);
  }
}

int toFourDigitYear(String stringYear) {
  //Takes in a 2 digit String year and returns a 4 digit year integer
  //Least year is 2000, highest year is 2099
  late int year;

  if (stringYear.length == 1) {
    stringYear = '0$stringYear';
  }
  if (stringYear.length == 2) {
    int currentYear = DateTime.now()
        .year; //Assign the current year of your device to the integer currentYear, e.g 2022
    String firstTwoDigitsOfCurrentYear = currentYear.toString().substring(0,
        2); //Select the first 2 digits of the currentYear integer and assign to String firstTwoDigitsOfCurrentYear, e.g 20
    year = int.parse(firstTwoDigitsOfCurrentYear +
        stringYear); //Combine firstTwoDigitsOfCurrentYear and the inputted stringYear

    //if (year < currentYear) year = year + 100;
  }
  return year;
}

bool isExpired({required int month, required int year}) {
  //Return false if not expired, true if expired
  //year must be 4 digit
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;

  if (year > currentYear) {
    return false;
  } else if (year == currentYear && month >= currentMonth) {
    return false;
  }
  return true;
}
