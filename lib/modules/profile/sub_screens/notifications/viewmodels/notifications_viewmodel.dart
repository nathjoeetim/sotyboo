import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/model/notification_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/widgets/notification_tile.dart';

class NotificationsViewmodel extends ChangeNotifier {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      notificationType: NotificationType.deposit,
      isRead: true,
      title: 'Deposit Successful',
      description:
          'You have deposited 10,000 NGN at 2022-12-06 11:05:07 (UTC).',
      message: '',
      time: '2022-12-06 11:05',
    ),
    NotificationModel(
      notificationType: NotificationType.voucher,
      isRead: false,
      title: '\$5 voucher available',
      description:
          'You have been given a p2p betting voucher, a bet discount for all even games.',
      message: '',
      time: '2022-12-05 11:11',
    ),
    NotificationModel(
      notificationType: NotificationType.withdrawal,
      isRead: false,
      title: 'Withdrawal Successful',
      description:
          'You have successfully withdrawn 1300.2 USDT at 2022-12-01 10:12:10 (UTC).',
      message: '',
      time: '2022-12-01 10:12',
    ),
    NotificationModel(
      notificationType: NotificationType.deposit,
      isRead: false,
      title: 'Deposit Successful',
      description:
          'You have successfully Deposited 100.23 USDT at 2022-11-025 05:12:10 (UTC).',
      message: '',
      time: '2022-12-01 10:12',
    ),
    NotificationModel(
      notificationType: NotificationType.admin,
      isRead: false,
      title: 'SiuuuSport have integrated combo betting',
      description: 'Got to p2p betting to participate and win big.',
      message: '',
      time: '2022-12-04 11:31',
    ),
  ];

  UnmodifiableListView<NotificationModel> get notifications =>
      UnmodifiableListView(_notifications);

  UnmodifiableListView<NotificationModel> getReadNotifications() {
    final readNotifications =
        _notifications.where((notification) => notification.isRead!).toList();
    return UnmodifiableListView(readNotifications);
  }

  int get newNotificationsLength {
    final newNotifications =
        _notifications.where((notification) => !notification.isRead!).toList();
    return newNotifications.length;
  }

  bool get hasUnreadNotifications =>
      _notifications.any((notification) => !notification.isRead!);

  markAsRead(NotificationModel notification) {
    /* _notifications[index].isRead = true;
    notifyListeners();*/

    int index = _notifications.indexOf(notification);
    if (index != -1) {
      _notifications[index].isRead = true;
      notifyListeners();
    }
  }

  markAllAsRead() {
    for (var notification in _notifications) {
      if (!notification.isRead!) {
        notification.isRead = true;
      }
    }
    notifyListeners();
  }

  deleteNotification(NotificationModel notification) {
    _notifications.remove(notification);
    notifyListeners();
  }
}
