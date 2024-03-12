// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportboo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportbooUser _$SportbooUserFromJson(Map<String, dynamic> json) => SportbooUser(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      sportbooId: json['sportbooId'] as String,
      phone: json['phone'] as String?,
      profileImgUrl: json['profileImgUrl'] as String?,
      walletBalance: (json['walletBalance'] as num).toDouble(),
      sportbooToken: json['sportbooToken'] as int,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      deviceId: json['deviceId'] as String?,
      unreadNotifications: json['unreadNotifications'] as int,
      unreadMessages: json['unreadMessages'] as int,
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddress.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      externalCommunication: json['externalCommunication'] == null
          ? null
          : ExternalCommunication.fromJson(
              json['externalCommunication'] as Map<String, dynamic>),
      inAppCommunication: json['inAppCommunication'] == null
          ? null
          : InAppCommunication.fromJson(
              json['inAppCommunication'] as Map<String, dynamic>),
      securityPreferences: json['securityPreferences'] == null
          ? null
          : SecurityPreferences.fromJson(
              json['securityPreferences'] as Map<String, dynamic>),
      walletActivities: json['walletActivities'] == null
          ? null
          : WalletActivities.fromJson(
              json['walletActivities'] as Map<String, dynamic>),
      securityAlerts: json['securityAlerts'] == null
          ? null
          : SecurityAlerts.fromJson(
              json['securityAlerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SportbooUserToJson(SportbooUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'userName': instance.userName,
      'sportbooId': instance.sportbooId,
      'phone': instance.phone,
      'profileImgUrl': instance.profileImgUrl,
      'walletBalance': instance.walletBalance,
      'sportbooToken': instance.sportbooToken,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'deviceId': instance.deviceId,
      'unreadNotifications': instance.unreadNotifications,
      'unreadMessages': instance.unreadMessages,
      'residentialAddress': instance.residentialAddress,
      'preferences': instance.preferences,
      'externalCommunication': instance.externalCommunication,
      'inAppCommunication': instance.inAppCommunication,
      'securityPreferences': instance.securityPreferences,
      'walletActivities': instance.walletActivities,
      'securityAlerts': instance.securityAlerts,
    };

ResidentialAddress _$ResidentialAddressFromJson(Map<String, dynamic> json) =>
    ResidentialAddress(
      id: json['id'] as int,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postCode: json['postCode'] as String,
    );

Map<String, dynamic> _$ResidentialAddressToJson(ResidentialAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postCode': instance.postCode,
    };

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      id: json['id'] as int,
      language: json['language'] as String,
      timeZone: json['timeZone'] as String,
      oddsDisplay: json['oddsDisplay'] as String,
      maximumInactivePeriod: json['maximumInactivePeriod'] as String,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'timeZone': instance.timeZone,
      'oddsDisplay': instance.oddsDisplay,
      'maximumInactivePeriod': instance.maximumInactivePeriod,
    };

ExternalCommunication _$ExternalCommunicationFromJson(
        Map<String, dynamic> json) =>
    ExternalCommunication(
      id: json['id'] as int,
      pushNotifications: json['pushNotifications'] as bool,
      sms: json['sms'] as bool,
      emails: json['emails'] as bool,
    );

Map<String, dynamic> _$ExternalCommunicationToJson(
        ExternalCommunication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pushNotifications': instance.pushNotifications,
      'sms': instance.sms,
      'emails': instance.emails,
    };

InAppCommunication _$InAppCommunicationFromJson(Map<String, dynamic> json) =>
    InAppCommunication(
      id: json['id'] as int,
      messages: json['messages'] as bool,
      popUps: json['popUps'] as bool,
    );

Map<String, dynamic> _$InAppCommunicationToJson(InAppCommunication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
      'popUps': instance.popUps,
    };

SecurityPreferences _$SecurityPreferencesFromJson(Map<String, dynamic> json) =>
    SecurityPreferences(
      id: json['id'] as int,
      twoStepVerification: json['twoStepVerification'] as bool,
      biometric: json['biometric'] as bool,
      screenShots: json['screenShots'] as bool,
      disableAccount: json['disableAccount'] as bool,
    );

Map<String, dynamic> _$SecurityPreferencesToJson(
        SecurityPreferences instance) =>
    <String, dynamic>{
      'id': instance.id,
      'twoStepVerification': instance.twoStepVerification,
      'biometric': instance.biometric,
      'screenShots': instance.screenShots,
      'disableAccount': instance.disableAccount,
    };

WalletActivities _$WalletActivitiesFromJson(Map<String, dynamic> json) =>
    WalletActivities(
      id: json['id'] as int,
      pushNotifications: json['pushNotifications'] as bool,
      sms: json['sms'] as bool,
      emails: json['emails'] as bool,
    );

Map<String, dynamic> _$WalletActivitiesToJson(WalletActivities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pushNotifications': instance.pushNotifications,
      'sms': instance.sms,
      'emails': instance.emails,
    };

SecurityAlerts _$SecurityAlertsFromJson(Map<String, dynamic> json) =>
    SecurityAlerts(
      id: json['id'] as int,
      pushNotifications: json['pushNotifications'] as bool,
      sms: json['sms'] as bool,
      emails: json['emails'] as bool,
    );

Map<String, dynamic> _$SecurityAlertsToJson(SecurityAlerts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pushNotifications': instance.pushNotifications,
      'sms': instance.sms,
      'emails': instance.emails,
    };
