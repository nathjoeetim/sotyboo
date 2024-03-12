import 'bet_market_data.dart';

class MarketData {
  final MarketType marketType;
  final bool isPopular;
  final BetMarketDatable data;
  bool state;

  MarketData(
      {required this.marketType,
      required this.isPopular,
      required this.data,
      this.state = false});
}

enum MarketType {
  oneXTwo(
      '1X2',
      'Users have to predict the outcome of the match in 90 minutes. The bet offers three possible outcomes: 1 (home team wins the match), X (teams draw), 2 (away team wins the match)',
      [
        {"marketName": "1", "id": "fullTime1"},
        {"marketName": "X", "id": "fullTimeX"},
        {"marketName": "2", "id": "fullTime2"},
        {"marketName": "1", "id": "1stHalf1"},
        {"marketName": "X", "id": "1stHalfX"},
        {"marketName": "2", "id": "1stHalf2"},
        {"marketName": "1", "id": "2ndHalf1"},
        {"marketName": "X", "id": "2ndHalfX"},
        {"marketName": "2", "id": "2ndHalf2"},
      ]),
  doubleChance(
      'Double Chance',
      'You have to predict the outcome of the match. There are 3 possible outcomes: 1X (at the end of the match the home team wins or draws), X2 (at the end of the match the away team wins or draws), 12 (at the end of the match the home team wins or the away team wins).',
      [
        {"marketName": "1X", "id": "fullTime1X"},
        {"marketName": "12", "id": "fullTime12"},
        {"marketName": "X2", "id": "fullTimeX2"},
        {"marketName": "1X", "id": "1stHalf1X"},
        {"marketName": "12", "id": "1stHalf12"},
        {"marketName": "X2", "id": "1stHalfX2"},
        {"marketName": "1X", "id": "2ndHalf1X"},
        {"marketName": "12", "id": "2ndHalf12"},
        {"marketName": "X2", "id": "2ndHalfX2"},
      ]),
  underOver(
      'Under/Over',
      'Will the match have more or less goals than the allotted Total line at Full time (FT)',
      [
        {"marketName": "Over", "id": "fullTimeOver05"},
        {"marketName": "Under", "id": "fullTimeUnder05"},
        {"marketName": "Over", "id": "fullTimeOver15"},
        {"marketName": "Under", "id": "fullTimeUnder15"},
        {"marketName": "Over", "id": "fullTimeOver25"},
        {"marketName": "Under", "id": "fullTimeUnder25"},
        {"marketName": "Over", "id": "fullTimeOver35"},
        {"marketName": "Under", "id": "fullTimeUnder35"},
        {"marketName": "Over", "id": "fullTimeOver45"},
        {"marketName": "Under", "id": "fullTimeUnder45"},

        {"marketName": "Over", "id": "1stHalfOver05"},
        {"marketName": "Under", "id": "1stHalfUnder05"},
        {"marketName": "Over", "id": "1stHalfOver15"},
        {"marketName": "Under", "id": "1stHalfUnder15"},
        {"marketName": "Over", "id": "1stHalfOver25"},
        {"marketName": "Under", "id": "1stHalfUnder25"},
        {"marketName": "Over", "id": "1stHalfOver35"},
        {"marketName": "Under", "id": "1stHalfUnder35"},
        {"marketName": "Over", "id": "1stHalfOver45"},
        {"marketName": "Under", "id": "1stHalfUnder45"},

        {"marketName": "Over", "id": "2ndHalfOver05"},
        {"marketName": "Under", "id": "2ndHalfUnder05"},
        {"marketName": "Over", "id": "2ndHalfOver15"},
        {"marketName": "Under", "id": "2ndHalfUnder15"},
        {"marketName": "Over", "id": "2ndHalfOver25"},
        {"marketName": "Under", "id": "2ndHalfUnder25"},
        {"marketName": "Over", "id": "2ndHalfOver35"},
        {"marketName": "Under", "id": "2ndHalfUnder35"},
        {"marketName": "Over", "id": "2ndHalfOver45"},
        {"marketName": "Under", "id": "2ndHalfUnder45"},

      ]),
  goalNoGoal(
      'Goal/No Goal',
      'Will both teams score at least one goal each? Or will one team fail to score?',
      [
        {"marketName": "GG", "id": "fullTimeGG"},
        {"marketName": "NG", "id": "fullTimeNG"},
        {"marketName": "GG", "id": "1stHalfGG"},
        {"marketName": "NG", "id": "1stHalfNG"},
        {"marketName": "GG", "id": "2ndHalfGG"},
        {"marketName": "NG", "id": "2ndHalfNG"},
      ]),
  oddEven(
      'Odd/Even', 'Odd or even total number of goals after Full time (FT)', [
    {"marketName": "Odd", "id": "fullTimeOdd"},
    {"marketName": "Even", "id": "fullTimeEven"},
    {"marketName": "Odd", "id": "1stHalfOdd"},
    {"marketName": "Even", "id": "1stHalfEven"},
    {"marketName": "Odd", "id": "2ndHalfOdd"},
    {"marketName": "Even", "id": "2ndHalfEven"},
  ]),
  correctScore(
      'Correct Score',
      'Final score after Regular time (FT) All possible results where the total number',
      [
        {"marketName": "1:0", "id": "10"},
        {"marketName": "0:0", "id": "00"},
        {"marketName": "0:1", "id": "01"},
        {"marketName": "2:0", "id": "20"},
        {"marketName": "1:1", "id": "11"},
        {"marketName": "0:2", "id": "02"},
        {"marketName": "3:0", "id": "30"},
        {"marketName": "2:2", "id": "22"},
        {"marketName": "0:3", "id": "03"},
        {"marketName": "3:1", "id": "31"},
        {"marketName": "3:3", "id": "33"},
        {"marketName": "1:3", "id": "13"},
        {"marketName": "3:2", "id": "32"},
        {"marketName": "4:4", "id": "44"},
        {"marketName": "2:3", "id": "23"},
        {"marketName": "4:0", "id": "40"},
        {"marketName": "5:5", "id": "55"},
        {"marketName": "0:4", "id": "04"},
        {"marketName": "4:1", "id": "41"},
        {"marketName": "others", "id": "others"},
        {"marketName": "1:4", "id": "14"},
        {"marketName": "4:2", "id": "42"},
        {"marketName": "2:4", "id": "24"},
        {"marketName": "4:3", "id": "43"},
        {"marketName": "3:4", "id": "34"},
        {"marketName": "2:1", "id": "21"},
        {"marketName": "1:2", "id": "12"},
      ]),
  halfTimeFullTime(
      'Half Time/Full Time',
      'A combination of the result at Half time coupled with the result at Full time.',
      [
        {"marketName": "1/1", "id": "1/1"},
        {"marketName": "1/X", "id": "1/X"},
        {"marketName": "2/2", "id": "2/2"},

        {"marketName": "X/1", "id": "X/1"},
        {"marketName": "X/X", "id": "X/X"},
        {"marketName": "X/2", "id": "X/2"},

        {"marketName": "2/1", "id": "2/1"},
        {"marketName": "2/X", "id": "2/X"},
        {"marketName": "1/2", "id": "1/2"},
      ]),
  handicap(
      'Handicap',
      'You have to predict the final result of the match taking in consideration the handicap in brackets. The handicap in brackets represents the home team.',
      [
        {"marketName": "1", "id": "home-21"},
        {"marketName": "X", "id": "home-2X"},
        {"marketName": "2", "id": "home-22"},

        {"marketName": "1", "id": "home-11"},
        {"marketName": "X", "id": "home-1X"},
        {"marketName": "2", "id": "home-12"},

        {"marketName": "1", "id": "home+11"},
        {"marketName": "X", "id": "home+1X"},
        {"marketName": "2", "id": "home+12"},

        {"marketName": "1", "id": "home+21"},
        {"marketName": "X", "id": "home+2X"},
        {"marketName": "2", "id": "home+22"},
      ]),
  drawNoBet(
      'Draw No Bet',
      'You have to predict which team will win the match. If the teams draw the selection will be voided.',
      [
        {"marketName": "1", "id": "1"},
        {"marketName": "2", "id": "2"},
      ]),
  multiCorrectScore1(
      'Multi C. Score (1)',
      'You have to predict which selection will contain the correct score of the match. Example: You choose the selection 0-0 / 1-1 / 0-1 . If the match finishes with one of the scores in your selection, your bet is a winner.',
      [
        {"marketName": "0-0/1-1", "id": "0-0/1-1"},
        {"marketName": "0-1/0-2/1-2", "id": "0-1/0-2/1-2"},
        {"marketName": "4-1/4-2/4-3", "id": "4-1/4-2/4-3"},
        {"marketName": "2-2/3-3/4-4", "id": "2-2/3-3/4-4"},
        {"marketName": "3-0/3-1/3-2", "id": "3-0/3-1/3-2"},
        {"marketName": "1-4/2-4/3-4", "id": "1-4/2-4/3-4"},
        {"marketName": "1-0/2-0/2-1", "id": "1-0/2-0/2-1"},
        {"marketName": "0-3/1-3/2-3", "id": "0-3/1-3/2-3"},
        {"marketName": "4-0/0-4/Other", "id": "4-0/0-4/Other"},
      ]),
  multiCorrectScore2(
      'Multi C. Score (2)',
      'You have to predict which selection will contain the correct score of the match. Example: You choose the selection 0-0 / 1-1 / 0-1 . If the match finishes with one of the scores in your selection, your bet is a winner.',
      [
        {"marketName": "0-0/1-1/0-1/1-0", "id": "0-0/1-1/0-1/1-0"},
        {"marketName": "2-2/2-3/3-2/3-3", "id": "2-2/2-3/3-2/3-3"},
        {"marketName": "2-0/2-1/3-0/3-1", "id": "2-0/2-1/3-0/3-1"},
        {"marketName": "4-0/4-1/4-2/4-3", "id": "4-0/4-1/4-2/4-3"},
        {"marketName": "0-2/1-2/0-3/1-3", "id": "0-2/1-2/0-3/1-3"},
        {"marketName": "0-4/1-4/2-4/3-4", "id": "0-4/1-4/2-4/3-4"},

        {"marketName": "4-0/Other", "id": "4-0/Other"},
      ]),
  score5Min(
      'Score 5 Minutes',
      'You have to predict whether a goal will be scored in the first 5 minutes of the match. (0:00 - 4:59)',
      [
        {"marketName": "Yes", "id": "yes"},
        {"marketName": "No", "id": "no"},
      ]),
  score10Min(
      'Score 10 Minutes',
      'You have to predict whether a goal will be scored in the first 10 minutes of the match. (0:00 - 9:59)',
      [
        {"marketName": "Yes", "id": "yes"},
        {"marketName": "No", "id": "no"},
      ]),
  score20Min(
      'Score 20 Minutes',
      'You have to predict whether a goal will be scored in the first 20 minutes of the match. (0:00 - 19:59)',
      [
        {"marketName": "Yes", "id": "yes"},
        {"marketName": "No", "id": "no"},
      ]),
  score30Min(
      'Score 30 Minutes',
      'You have to predict whether a goal will be scored in the first 30 minutes of the match. (0:00 - 29:59)',
      [
        {"marketName": "Yes", "id": "yes"},
        {"marketName": "No", "id": "no"},
      ]),
  goalNoGoal2p(
      'GG/NG 2+',
      'You have to predict if both teams will score 2 or more goals during the match',
      [
        {"marketName": "GG", "id": "gg"},
        {"marketName": "NG", "id": "ng"},
      ]),
  totalGoalsExact('Total Goals(Exact)',
      'Predict the exact number of goals scored during regular time (FT).', [
    {"marketName": "1", "id": "1"},
    {"marketName": "2", "id": "2"},
    {"marketName": "3", "id": "3"},
    {"marketName": "4", "id": "4"},
    {"marketName": "5", "id": "5"},
    {"marketName": "6", "id": "6"},
  ]),
  firstTeamToScore(
      'First Team To Score',
      'You have to predict which team will score the first goal of the match.',
      [
        {"marketName": "1", "id": "1"},
        {"marketName": "noGoal", "id": "noGoal"},
        {"marketName": "2", "id": "2"},
      ]);

  final String name;
  final String description;
  final List<Map<String, String>> markets;

  const MarketType(this.name, this.description, this.markets);
}
