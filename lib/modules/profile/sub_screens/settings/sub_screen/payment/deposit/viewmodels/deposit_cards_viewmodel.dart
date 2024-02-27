import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/model/deposit_card.dart';

class DepositCardsViewmodel extends ChangeNotifier {
  final List<DepositCard> _depositCards = [
    DepositCard(
      cardCategory: 'Debit Card',
      cardType: 'mastercard',
      cardName: 'Ukpe Jacob',
      cardNumber: '1234 5678 1234 3456',
      expiryMonth: '10',
      expiryYear: '24',
      securityCode: '453',
    ),
  ];

  //late DepositCard _selectedCard;

  /*initialize() {
    _selectedCard = depositCards[0];
  }*/

  UnmodifiableListView<DepositCard> get depositCards =>
      UnmodifiableListView(_depositCards);
  //DepositCard get selectedCard => _selectedCard;

  /*set selectedCard(value) {
    _selectedCard = value;
    notifyListeners();
  }*/

  addDepositCard(DepositCard depositCard) {
    _depositCards.add(depositCard);
    notifyListeners();
  }
}
