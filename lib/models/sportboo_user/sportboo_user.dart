import 'package:json_annotation/json_annotation.dart';

part 'sportboo_user.g.dart';

@JsonSerializable()
class SportbooUser {
  final int id;
  final String fullName;
  final String email;
  final String userName;
  final String sportbooId;
  final String? phone;
  final String? profileImgUrl;
  final String accessToken;
  final String refreshToken;
  final String? deviceId;
  final int unreadNotifications;
  final int unreadMessages;

  final ResidentialAddress? residentialAddress;
  final Preferences? preferences;
  final ExternalCommunication? externalCommunication;
  final InAppCommunication? inAppCommunication;
  final SecurityPreferences? securityPreferences;
  final WalletActivities? walletActivities;
  final SecurityAlerts? securityAlerts;

  SportbooUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.userName,
      required this.sportbooId,
      required this.phone,
      required this.profileImgUrl,
      required this.accessToken,
      required this.refreshToken,
      required this.deviceId,
      required this.unreadNotifications,
      required this.unreadMessages,
      required this.residentialAddress,
      required this.preferences,
      required this.externalCommunication,
      required this.inAppCommunication,
      required this.securityPreferences,
      required this.walletActivities,
      required this.securityAlerts});


  /// Connect the generated [_$SportbooUserFromJson] function to the `fromJson`
  /// factory.
  factory SportbooUser.fromJson(Map<String, dynamic> json) => _$SportbooUserFromJson(json);

  /// Connect the generated [_$SportbooUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SportbooUserToJson(this);

}

@JsonSerializable()
class ResidentialAddress {
  final int? id;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? postCode;

  ResidentialAddress(
      {required this.id,
      required this.address,
      required this.city,
      required this.state,
      required this.country,
      required this.postCode});

  /// Connect the generated [_$ResidentialAddressFromJson] function to the `fromJson`
  /// factory.
  factory ResidentialAddress.fromJson(Map<String, dynamic> json) => _$ResidentialAddressFromJson(json);

  /// Connect the generated [_$ResidentialAddressToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResidentialAddressToJson(this);

}

@JsonSerializable()
class Preferences {
  final int? id;
  final String? language;
  final String? timeZone;
  final String? oddsDisplay;
  final String? maximumInactivePeriod;

  Preferences(
      {required this.id,
      required this.language,
      required this.timeZone,
      required this.oddsDisplay,
      required this.maximumInactivePeriod});

  /// Connect the generated [_$PreferencesFromJson] function to the `fromJson`
  /// factory.
  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  /// Connect the generated [_$PreferencesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

}

@JsonSerializable()
class ExternalCommunication {
  final int? id;
  final bool? pushNotifications;
  final bool? sms;
  final bool? emails;

  ExternalCommunication(
      {required this.id,
      required this.pushNotifications,
      required this.sms,
      required this.emails});

  /// Connect the generated [_$ExternalCommunicationFromJson] function to the `fromJson`
  /// factory.
  factory ExternalCommunication.fromJson(Map<String, dynamic> json) => _$ExternalCommunicationFromJson(json);

  /// Connect the generated [_$ExternalCommunicationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExternalCommunicationToJson(this);

}

@JsonSerializable()
class InAppCommunication {
  final int? id;
  final bool? messages;
  final bool? popUps;

  InAppCommunication(
      {required this.id, required this.messages, required this.popUps});

  /// Connect the generated [_$InAppCommunicationFromJson] function to the `fromJson`
  /// factory.
  factory InAppCommunication.fromJson(Map<String, dynamic> json) => _$InAppCommunicationFromJson(json);

  /// Connect the generated [_$InAppCommunicationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InAppCommunicationToJson(this);

}

@JsonSerializable()
class SecurityPreferences {
  final int? id;
  final bool? twoStepVerification;
  final bool? biometric;
  final bool? screenShots;
  final bool? disableAccount;

  SecurityPreferences(
      {required this.id,
      required this.twoStepVerification,
      required this.biometric,
      required this.screenShots,
      required this.disableAccount});

  /// Connect the generated [_$SecurityPreferencesFromJson] function to the `fromJson`
  /// factory.
  factory SecurityPreferences.fromJson(Map<String, dynamic> json) => _$SecurityPreferencesFromJson(json);

  /// Connect the generated [_$SecurityPreferencesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SecurityPreferencesToJson(this);

}

@JsonSerializable()
class WalletActivities {
  final int? id;
  final bool? pushNotifications;
  final bool? sms;
  final bool? emails;

  WalletActivities(
      {required this.id,
      required this.pushNotifications,
      required this.sms,
      required this.emails});

  /// Connect the generated [_$WalletActivitiesFromJson] function to the `fromJson`
  /// factory.
  factory WalletActivities.fromJson(Map<String, dynamic> json) => _$WalletActivitiesFromJson(json);

  /// Connect the generated [_$WalletActivitiesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WalletActivitiesToJson(this);

}

@JsonSerializable()
class SecurityAlerts {
  final int? id;
  final bool? pushNotifications;
  final bool? sms;
  final bool? emails;

  SecurityAlerts(
      {required this.id,
      required this.pushNotifications,
      required this.sms,
      required this.emails});

  /// Connect the generated [_$SecurityAlertsFromJson] function to the `fromJson`
  /// factory.
  factory SecurityAlerts.fromJson(Map<String, dynamic> json) => _$SecurityAlertsFromJson(json);

  /// Connect the generated [_$SecurityAlertsToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SecurityAlertsToJson(this);

}
