import 'package:flutter/foundation.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/model/player_model.dart';

class LineupViewmodel extends ChangeNotifier {
  List<PlayerModel> _firstTeamPlayers() {
    return [
      PlayerModel(
        playerName: 'Ederson',
        playerNumber: '1',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Walker',
        playerNumber: '2',
        countryCode: 'CH',
        goals: 1,
        booking: 'red',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Stone',
        playerNumber: '3',
        countryCode: 'BR',
        goals: 0,
        booking: 'yellow',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Dias',
        playerNumber: '4',
        countryCode: 'BR',
        goals: 2,
        booking: 'yellow',
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Akanji',
        playerNumber: '5',
        countryCode: 'BR',
        goals: 0,
        booking: 'yellow',
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Rodrigo',
        playerNumber: '6',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: true,
      ),
      PlayerModel(
        playerName: 'De Bryune',
        playerNumber: '10',
        countryCode: 'CH',
        goals: 3,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Gundogan',
        playerNumber: '8',
        countryCode: 'CH',
        goals: 1,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Bernardo',
        playerNumber: '7',
        countryCode: 'CH',
        goals: 0,
        booking: 'yellow-red',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Haaland',
        playerNumber: '9',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: true,
      ),
      PlayerModel(
        playerName: 'Grealish',
        playerNumber: '11',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
    ];
  }

  List<PlayerModel> _secondTeamPlayers() {
    return [
      PlayerModel(
        playerName: 'De Gea',
        playerNumber: '1',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Wan-Bissaka',
        playerNumber: '2',
        countryCode: 'CH',
        goals: 0,
        booking: 'red',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Varane',
        playerNumber: '3',
        countryCode: 'CH',
        goals: 1,
        booking: 'yellow',
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Lindelof',
        playerNumber: '4',
        countryCode: 'BR',
        goals: 2,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Shaw',
        playerNumber: '5',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Casemiro',
        playerNumber: '6',
        countryCode: 'BR',
        goals: 1,
        booking: null,
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Fred',
        playerNumber: '10',
        countryCode: 'BR',
        goals: 1,
        booking: 'yellow',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Sancho',
        playerNumber: '8',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Fernandes',
        playerNumber: '7',
        countryCode: 'BR',
        goals: 2,
        booking: 'yellow-red',
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Eriksen',
        playerNumber: '11',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: true,
        isReceivingTreatment: false,
      ),
      PlayerModel(
        playerName: 'Rashford',
        playerNumber: '9',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
      ),
    ];
  }

  List<PlayerModel> _firstTeamMissingPlayers() {
    return [
      PlayerModel(
        playerName: 'Gundogan',
        playerNumber: '8',
        countryCode: 'CH',
        goals: 1,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
        condition: 'Suspended',
      ),
      PlayerModel(
          playerName: 'Bernardo',
          playerNumber: '7',
          countryCode: 'CH',
          goals: 0,
          booking: 'yellow-red',
          isSubstituted: false,
          isReceivingTreatment: false,
          condition: 'Shoulder Injury'),
      PlayerModel(
        playerName: 'Haaland',
        playerNumber: '9',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: true,
        condition: 'Calf Injury',
      ),
      PlayerModel(
        playerName: 'Grealish',
        playerNumber: '11',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: true,
        isReceivingTreatment: false,
        condition: 'Thigh Injury',
      ),
    ];
  }

  List<PlayerModel> _secondTeamMissingPlayers() {
    return [
      PlayerModel(
        playerName: 'Fred',
        playerNumber: '10',
        countryCode: 'BR',
        goals: 1,
        booking: 'yellow',
        isSubstituted: false,
        isReceivingTreatment: false,
        condition: 'Injury',
      ),
      PlayerModel(
        playerName: 'Sancho',
        playerNumber: '8',
        countryCode: 'BR',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
        condition: 'Inactive',
      ),
      PlayerModel(
        playerName: 'Fernandes',
        playerNumber: '7',
        countryCode: 'BR',
        goals: 2,
        booking: 'yellow-red',
        isSubstituted: false,
        isReceivingTreatment: false,
        condition: 'Muscle Injury',
      ),
      PlayerModel(
        playerName: 'Eriksen',
        playerNumber: '11',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: true,
        isReceivingTreatment: false,
        condition: 'Injury',
      ),
      PlayerModel(
        playerName: 'Rashford',
        playerNumber: '9',
        countryCode: 'CH',
        goals: 0,
        booking: null,
        isSubstituted: false,
        isReceivingTreatment: false,
        condition: 'Knock',
      ),
    ];
  }

  final PlayerModel _firstTeamCoach = PlayerModel(
    playerName: 'Guardiola P.',
    playerNumber: '',
    countryCode: 'BR',
    goals: 0,
    booking: null,
    isSubstituted: false,
    isReceivingTreatment: false,
  );

  final PlayerModel _secondTeamCoach = PlayerModel(
    playerName: 'ten Hag E.',
    playerNumber: '',
    countryCode: 'CH',
    goals: 0,
    booking: null,
    isSubstituted: false,
    isReceivingTreatment: false,
  );

  final String _firstTeamFormation = '4-3-3';
  final String _secondTeamFormation = '4-2-3-1';

  List<PlayerModel> get firstTeamPlayers => _firstTeamPlayers();
  List<PlayerModel> get secondTeamPlayers => _secondTeamPlayers();
  List<PlayerModel> get firstTeamMissingPlayers => _firstTeamMissingPlayers();
  List<PlayerModel> get secondTeamMissingPlayers => _secondTeamMissingPlayers();
  PlayerModel get firstTeamCoach => _firstTeamCoach;
  PlayerModel get secondTeamCoach => _secondTeamCoach;
  String get firstTeamFormation => _firstTeamFormation;
  String get secondTeamFormation => _secondTeamFormation;
}
