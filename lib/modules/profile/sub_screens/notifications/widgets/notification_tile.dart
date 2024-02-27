import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/model/notification_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

enum NotificationType {
  withdrawal,
  deposit,
  voucher,
  admin,
}

class NotificationTile extends HookWidget {
  const NotificationTile({
    Key? key,
    required this.notification,
    required this.onPressed,
  }) : super(key: key);

  final NotificationModel notification;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    late String icon;

    String keyWord =
        notification.isRead != null && notification.isRead! ? 'read-' : 'new-';

    if (notification.notificationType == NotificationType.withdrawal) {
      icon = '${keyWord}mail';
    } else if (notification.notificationType == NotificationType.deposit) {
      icon = '${keyWord}deposit';
    } else if (notification.notificationType == NotificationType.voucher) {
      icon = '${keyWord}voucher';
    } else {
      icon = '${keyWord}notification';
    }

    final isSwiped = useState(false);

    void toggleSwipe() {
      isSwiped.value = !isSwiped.value;
    }

    void onDeletePressed() {
      Provider.of<NotificationsViewmodel>(context, listen: false)
          .deleteNotification(notification);
    }

    Widget deleteWidget() => Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              onDeletePressed();
              toggleSwipe();
            },
            child: Container(
              width: 64.w,
              height: (93 * MediaQuery.of(context).textScaleFactor).h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primaryBase6,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(4.r),
                  bottomLeft: Radius.circular(4.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary2,
                  radius: 16.r,
                  child: Image.asset(
                    getImage('delete-bin'),
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
            ),
          ),
        );

    return Dismissible(
      key: UniqueKey(),
      direction:
          isSwiped.value ? DismissDirection.none : DismissDirection.horizontal,
      onDismissed: (direction) {
        onDeletePressed();
      },
      background: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryBase6,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(4.r),
            bottomLeft: Radius.circular(4.r),
            bottomRight: Radius.circular(24.r),
          ),
        ),
        child: deleteWidget(),
      ),
      child: InkWell(
        onTap: () {
          if (isSwiped.value) {
            toggleSwipe();
            //isSwiped.value = false;
          } else {
            onPressed();
          }
        },
        onLongPress: toggleSwipe,
        child: Stack(
          children: [
            // Delete Widget
            if (isSwiped.value) deleteWidget(),
            // Main Notification Tile
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                left: 8.w,
                right: 16.w,
              ),
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: AppColors.tertiary1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(4.r),
                  bottomLeft: Radius.circular(4.r),
                  bottomRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tertiaryBase10.withOpacity(0.08),
                    blurRadius: 16.r,
                    offset: Offset(0, 4.w),
                  )
                ],
              ),
              transform: Matrix4.translationValues(
                isSwiped.value ? -(64 + 16).w : 0,
                0,
                0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    getSvg(icon),
                    height: 32.h,
                    width: 32.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (notification.isRead == null ||
                                !notification.isRead!)
                              Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: CircleAvatar(
                                  radius: 3.r,
                                  backgroundColor: AppColors.primaryTint7,
                                ),
                              ),
                            Expanded(
                              child: Text(
                                notification.title ?? '',
                                style: TextStyle(
                                  color: notification.isRead == null ||
                                          !notification.isRead!
                                      ? AppColors.tertiaryBase10
                                      : AppColors.tertiary6,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          notification.description ?? '',
                          style: TextStyle(
                            color: AppColors.tertiary6,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          notification.time ?? '',
                          style: TextStyle(
                            color: AppColors.tertiary8,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
