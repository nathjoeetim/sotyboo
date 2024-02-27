class NotificationSettingMultiToggle {
  NotificationSettingMultiToggle({
    required this.pushNotification,
    required this.sms,
    required this.emails,
  });

  bool pushNotification;
  bool sms;
  bool emails;

  NotificationSettingMultiToggle.initialize({
    this.pushNotification = false,
    this.sms = false,
    this.emails = false,
  });

  // Custom copyWith method to create a new instance with updated values
  NotificationSettingMultiToggle copyWith({
    bool? pushNotification,
    bool? sms,
    bool? emails,
  }) {
    return NotificationSettingMultiToggle(
      pushNotification: pushNotification ?? this.pushNotification,
      sms: sms ?? this.sms,
      emails: emails ?? this.emails,
    );
  }
}
