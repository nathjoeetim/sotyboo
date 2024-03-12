class BetData {
  final String? imgUrl;
  final bool isOpen;
  final String userName;
  final String awayTeam;
  final String awayUrl;
  final String country;
  final String homeTeam;
  final String homeUrl;
  final String league;
  final bool placeable;
  final int time;
  final String betAmount;
  final String betLimit;
  final String placedBet;
  final String id;
  final String betType;
  final List markets;

  final String countryImgPath;
  final String gameId;
  final String betCode;
  final String ticketId;

  BetData({
    required this.betType,
    required this.placeable,
    required this.id,
    required this.isOpen,
    required this.userName,
    required this.imgUrl,
    required this.league,
    required this.country,
    required this.homeUrl,
    required this.awayUrl,
    required this.homeTeam,
    required this.awayTeam,
    required this.time,
    required this.markets,
    required this.betAmount,
    required this.betLimit,
    required this.placedBet,
    required this.countryImgPath,
    required this.gameId,
    required this.betCode,
    required this.ticketId,
  });

  String get availableLiquidity => 'null';

  String get fixture => 'null';

  String get betOption => 'null';

  String get team => 'null';
}
