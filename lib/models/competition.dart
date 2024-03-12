class Competition {
  int id;
  int? sportId;
  int? countryId;
  String name;
  bool? active;
  String? shortCode;
  String imagePath;
  String? type;
  String? subType;
  String? lastPlayedAt;
  int? category;
  bool? hasJerseys;
  Country country;

  Competition({
    required this.id,
    required this.sportId,
    required this.countryId,
    required this.name,
    required this.active,
    required this.shortCode,
    required this.imagePath,
    required this.type,
    required this.subType,
    required this.lastPlayedAt,
    required this.category,
    required this.hasJerseys,
    required this.country,
  });

  factory Competition.fromMap(Map<dynamic, dynamic> map) {
    return Competition(
      id: map['id'],
      sportId: map['sport_id'],
      countryId: map['country_id'],
      name: map['name'],
      active: map['active'],
      shortCode: map['short_code'],
      imagePath: map['image_path'],
      type: map['type'],
      subType: map['sub_type'],
      lastPlayedAt: map['last_played_at'],
      category: map['category'],
      hasJerseys: map['has_jerseys'],
      country: Country.fromMap(map['country']),
    );
  }
}

class Country {
  int id;
  int? continentId;
  String name;
  String? officialName;
  String? fifaName;
  String? iso2;
  String? iso3;
  String? latitude;
  String? longitude;
  List<String>? borders;
  String imagePath;

  Country({
    required this.id,
    required this.continentId,
    required this.name,
    required this.officialName,
    required this.fifaName,
    required this.iso2,
    required this.iso3,
    required this.latitude,
    required this.longitude,
    required this.borders,
    required this.imagePath,
  });

  factory Country.fromMap(Map<dynamic, dynamic> map) {
    return Country(
      id: map['id'],
      continentId: map['continent_id'],
      name: map['name'],
      officialName: map['official_name'],
      fifaName: map['fifa_name'],
      iso2: map['iso2'],
      iso3: map['iso3'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      borders: List<String>.from(map['borders']),
      imagePath: map['image_path'],
    );
  }
}
