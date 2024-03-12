class MatchDetails {
  final String gameId;
  final String homeTeam;
  final String awayTeam;
  final String countryName;
  final String leagueName;

  final int matchStartsAt;
  final String homeImgPath;
  final String awayImgPath;
  final String countryImgPath;

  MatchDetails(
      {
        required this.gameId,
        required this.homeTeam,
      required this.awayTeam,
      required this.countryName,
      required this.leagueName,
      required this.matchStartsAt,
      required this.homeImgPath,
      required this.awayImgPath,
      required this.countryImgPath});

}
