import 'package:flutter/cupertino.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/model/notification_setting_multitoggle.dart';

class NotificationsSettingsViewmodel extends ChangeNotifier {
  late NotificationSettingMultiToggle _walletActivities;
  late NotificationSettingMultiToggle _securityAlerts;
  late bool _matchAlerts;
  late NotificationSettingMultiToggle _betUpdates;
  late NotificationSettingMultiToggle _bookieAlerts;
  late bool _promotions;
  late NotificationSettingMultiToggle _productUpdates;

  initialize() {
    _walletActivities = NotificationSettingMultiToggle.initialize();
    _securityAlerts = NotificationSettingMultiToggle.initialize();
    _matchAlerts = false;
    _betUpdates = NotificationSettingMultiToggle.initialize();
    _bookieAlerts = NotificationSettingMultiToggle.initialize();
    _promotions = false;
    _productUpdates = NotificationSettingMultiToggle.initialize();
  }

  // Getters
  NotificationSettingMultiToggle get walletActivities => _walletActivities;
  NotificationSettingMultiToggle get securityAlerts => _securityAlerts;
  bool get matchAlerts => _matchAlerts;
  NotificationSettingMultiToggle get betUpdates => _betUpdates;
  NotificationSettingMultiToggle get bookieAlerts => _bookieAlerts;
  bool get promotions => _promotions;
  NotificationSettingMultiToggle get productUpdates => _productUpdates;

  set matchAlerts(bool value) {
    _matchAlerts = value;
    notifyListeners();
  }

  set promotions(bool value) {
    _promotions = value;
    notifyListeners();
  }

  // Update methods for NotificationSettingMultiToggle fields
  void updateWalletActivities({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    _walletActivities = _walletActivities.copyWith(
      pushNotification: pushNotification ?? _walletActivities.pushNotification,
      sms: sms ?? _walletActivities.sms,
      emails: emails ?? _walletActivities.emails,
    );
    notifyListeners();
  }

  void updateSecurityAlerts({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    _securityAlerts = _securityAlerts.copyWith(
      pushNotification: pushNotification ?? _securityAlerts.pushNotification,
      sms: sms ?? _securityAlerts.sms,
      emails: emails ?? _securityAlerts.emails,
    );
    notifyListeners();
  }

  void updateBetUpdates({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    _betUpdates = _betUpdates.copyWith(
      pushNotification: pushNotification ?? _betUpdates.pushNotification,
      sms: sms ?? _betUpdates.sms,
      emails: emails ?? _betUpdates.emails,
    );
    notifyListeners();
  }

  void updateBookieAlerts({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    _bookieAlerts = _bookieAlerts.copyWith(
      pushNotification: pushNotification ?? _bookieAlerts.pushNotification,
      sms: sms ?? _bookieAlerts.sms,
      emails: emails ?? _bookieAlerts.emails,
    );
    notifyListeners();
  }

  void updateProductUpdates({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    _productUpdates = _productUpdates.copyWith(
      pushNotification: pushNotification ?? _productUpdates.pushNotification,
      sms: sms ?? _productUpdates.sms,
      emails: emails ?? _productUpdates.emails,
    );
    notifyListeners();
  }
}
