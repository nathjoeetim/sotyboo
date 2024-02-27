import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/tabs/new_notifications_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/tabs/read_notifications_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notification_tabs_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_tab_container.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class NotificationScreen extends HookWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final pages = [
    const NewNotificationsTab(),
    const ReadNotificationsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Provider.of<ActivitiesTabsViewmodel>(context, listen: false).initialize();
      // Provider.of<DepositLimitViewmodel>(context, listen: false).initialize();
      // Provider.of<TimeoutViewmodel>(context, listen: false).initialize();
      return null;
    });

    return CustomScaffold(
      title: 'Notifications',
      trailing: const MarkAsReadButton(),
      child:
          Consumer<NotificationTabsViewmodel>(builder: (context, model, child) {
        return CustomTabContainer(
          labels: model.labels,
          currentPosition: model.currentPosition,
          pages: pages,
          onPressed: (index) => model.currentPosition = index,
        );
      }),
    );
  }
}

class MarkAsReadButton extends StatelessWidget {
  const MarkAsReadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsViewmodel>(builder: (context, model, child) {
      return model.hasUnreadNotifications
          ? InkWell(
              onTap: () {
                model.markAllAsRead();
              },
              child: Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    width: 1.h,
                    color: AppColors.primaryBase6,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 16.h,
                      width: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.h,
                          color: AppColors.primaryBase6,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Mark all as read',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBase6,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }
}
