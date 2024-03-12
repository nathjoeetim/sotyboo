class BetSlip {
  final BetType betType;

  BetSlip({required this.betType});
}

enum BetType {
  even('EVEN'), odd('ODD'), combo('COMBO');

  final String name;

  const BetType(this.name);

}
