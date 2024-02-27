import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/trash.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/model/notification_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';
import 'package:provider/provider.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Naira Deposit',
     trailing: Trash(
       onPressed: (){
         Provider.of<NotificationsViewmodel>(context, listen: false)
             .deleteNotification(notification);
       },
     ),
     /* trailing: InkWell(
        onTap: () {
          // Delete Message
          Provider.of<NotificationsViewmodel>(context, listen: false)
              .deleteNotification(notification);
          Navigator.pop(context);
        },
        child: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.h,
              color: AppColors.tertiary3,
            ),
          ),
          child: SvgPicture.asset(
            getSvg('trash-2'),
            height: 24.h,
            width: 24.w,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),*/
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Text(
                notification.title ?? '',
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                notification.time ?? '',
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${notification.description}\n',
                      style: TextStyle(
                        color: AppColors.tertiary6,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                    TextSpan(
                      text:
                          'If you don’t recognize this activity, please contact us immediately.',
                      style: TextStyle(
                        color: AppColors.tertiary6,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  /// Expand message
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    'View more',
                    style: TextStyle(
                      color: AppColors.primaryBase6,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
