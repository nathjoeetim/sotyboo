import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/widgets/notification_tile.dart';

class NotificationModel {
  NotificationModel(
      {this.notificationType,
      this.isRead = false,
      this.title,
      this.description,
      this.message,
      this.time});

  NotificationType? notificationType;
  bool? isRead;
  String? title;
  String? description;
  String? message;
  String? time;
}
