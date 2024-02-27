class PlayerModel {
  final String playerName;
  final String playerNumber;
  final String? countryCode;
  final int goals;
  final String? booking;
  final bool isSubstituted;
  final bool isReceivingTreatment;
  final String? condition;

  PlayerModel({
    required this.playerName,
    required this.playerNumber,
    this.countryCode,
    required this.goals,
    required this.booking,
    required this.isSubstituted,
    required this.isReceivingTreatment,
    this.condition,
  });
}
