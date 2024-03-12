class Fixture {
  final int id;
  final int? sportId;
  final int? leagueId;
  final int? seasonId;
  final int? stageId;
  final int? roundId;
  final int? stateId;
  final int? venueId;
  final String? name;
  final DateTime? startingAt;
  final String? leg;
  final int? length;
  final bool? placeholder;
  final bool? hasOdds;
  final int startingAtTimestamp;
  final FixtureState? state;
  final List<Participant> participants;

  Fixture({
    required this.id,
    this.sportId,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.roundId,
    this.stateId,
    this.venueId,
    this.name,
    this.startingAt,
    this.leg,
    this.length,
    this.placeholder,
    this.hasOdds,
    required this.startingAtTimestamp,
    this.state,
    required this.participants,
  });

  factory Fixture.fromMap(Map<dynamic, dynamic> map) {
    return Fixture(
      id: map['id'],
      sportId: map['sport_id'],
      leagueId: map['league_id'],
      seasonId: map['season_id'],
      stageId: map['stage_id'],
      roundId: map['round_id'],
      stateId: map['state_id'],
      venueId: map['venue_id'],
      name: map['name'],
      startingAt: DateTime.parse(map['starting_at']),
      leg: map['leg'],
      length: map['length'],
      placeholder: map['placeholder'],
      hasOdds: map['has_odds'],
      startingAtTimestamp: map['starting_at_timestamp'],
      state: FixtureState.fromMap(map['state']),
      participants: List<Participant>.from(
        map['participants'].map((participant) => Participant.fromMap(participant)),
      ),
    );
  }
}

class FixtureState {
  final int id;
  final String? state;
  final String? name;
  final String? shortName;
  final String? developerName;

  FixtureState({
    required this.id,
    this.state,
    this.name,
    this.shortName,
    this.developerName,
  });

  factory FixtureState.fromMap(Map<dynamic, dynamic> map) {
    return FixtureState(
      id: map['id'],
      state: map['state'],
      name: map['name'],
      shortName: map['short_name'],
      developerName: map['developer_name'],
    );
  }
}

class Participant {
  final int id;
  final int? sportId;
  final int? countryId;
  final int? venueId;
  final String? gender;
  final String name;
  final String imagePath;
  final int? founded;
  final String? type;
  final bool? placeholder;
  final DateTime? lastPlayedAt;
  final ParticipantMeta? meta;

  Participant({
    required this.id,
    this.sportId,
    this.countryId,
    this.venueId,
    this.gender,
    required this.name,
    required this.imagePath,
    this.founded,
    this.type,
    this.placeholder,
    this.lastPlayedAt,
    this.meta,
  });

  factory Participant.fromMap(Map<dynamic, dynamic> map) {
    return Participant(
      id: map['id'],
      sportId: map['sport_id'],
      countryId: map['country_id'],
      venueId: map['venue_id'],
      gender: map['gender'],
      name: map['name'],
      imagePath: map['image_path'],
      founded: map['founded'],
      type: map['type'],
      placeholder: map['placeholder'],
      lastPlayedAt: DateTime.parse(map['last_played_at']),
      meta: ParticipantMeta.fromMap(map['meta']),
    );
  }
}

class ParticipantMeta {
  final String? location;
  final dynamic winner;
  final dynamic position;

  ParticipantMeta({
    this.location,
    this.winner,
    this.position,
  });

  factory ParticipantMeta.fromMap(Map<String, dynamic> map) {
    return ParticipantMeta(
      location: map['location'],
      winner: map['winner'],
      position: map['position'],
    );
  }
}
