import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/sub_screen/notification_details.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/widgets/intro_box.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/widgets/no_notification_card.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/widgets/notification_tile.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

import '../../../../../unils/navigation.dart';

class NewNotificationsTab extends StatelessWidget {
  const NewNotificationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const IntroBox(),
          Consumer<NotificationsViewmodel>(builder: (context, model, child) {
            if (model.notifications.isEmpty) {
              return const NoNotificationCard();
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14.h,
                        bottom: 16.h,
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: AppColors.tertiary5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: model.notifications.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NotificationTile(
                            notification: model.notifications[index],
                            onPressed: () {
                              PageRouter.gotoWidget(
                                context,
                                NotificationDetailsScreen(
                                  notification: model.notifications[index],
                                ),
                              );
                              model.markAsRead(model.notifications[index]);
                            },
                          );
                        }),
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
