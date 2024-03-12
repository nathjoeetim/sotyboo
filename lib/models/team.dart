class Team {
  final String name;
  final String imagePath;
  final int id;
  final int? sportId;
  final int countryId;
  final int? venueId;
  final Country country;

  Team({
    required this.name,
    required this.imagePath,
    required this.id,
    required this.sportId,
    required this.countryId,
    required this.venueId,
    required this.country,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'] as String,
      imagePath: map['image_path'] as String,
      id: map['id'] as int,
      sportId: map['sport_id'],
      countryId: map['country_id'] as int,
      venueId: map['venue_id'],
      country: Country.fromMap(map['country'] as Map<String, dynamic>),
    );
  }
}

class Country {
  final int id;
  final int continentId;
  final String name;

  Country({
    required this.id,
    required this.continentId,
    required this.name,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] as int,
      continentId: map['continent_id'] as int,
      name: map['name'] as String,
    );
  }
}
