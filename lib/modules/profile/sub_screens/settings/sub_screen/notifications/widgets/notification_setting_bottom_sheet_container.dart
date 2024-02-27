import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/bottom_sheet_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/model/notification_setting_multitoggle.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_bottom_sheet.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class NotificationSettingBottomSheetContainer extends StatelessWidget {
  const NotificationSettingBottomSheetContainer({
    Key? key,
    required this.title,
    required this.description,
    required this.multiToggle,
    required this.onPushNotificationToggle,
    required this.onSmsToggle,
    required this.onEmailsToggle,
  }) : super(key: key);

  final String title;
  final String description;
  final NotificationSettingMultiToggle multiToggle;
  final Function(bool)? onPushNotificationToggle;
  final Function(bool)? onSmsToggle;
  final Function(bool)? onEmailsToggle;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),
          BottomSheetDescriptionText(text: description),
          SizedBox(height: 16.h),
          SvgPicture.asset(
            getSvg('notification-setting'),
            height: 80.h,
            width: 91.5.w,
          ),
          SizedBox(height: 16.h),
          NotificationSettingBottomSheetTile(
            title: 'Push Notifications',
            toggle: multiToggle.pushNotification,
            onChanged: onPushNotificationToggle,
          ),
          NotificationSettingBottomSheetTile(
            title: 'SMS',
            toggle: multiToggle.sms,
            onChanged: onSmsToggle,
          ),
          NotificationSettingBottomSheetTile(
            title: 'Emails',
            toggle: multiToggle.emails,
            onChanged: onEmailsToggle,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class NotificationSettingBottomSheetTile extends StatelessWidget {
  const NotificationSettingBottomSheetTile({
    Key? key,
    required this.title,
    this.toggle,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final bool? toggle;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: onPressed,
      onTap: () {
        // Call onChanged callback to update the toggle value
        if (onChanged != null) {
          onChanged!(!toggle!);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          border: Border(
            bottom: BorderSide(
              width: 1.h,
              color: AppColors.tertiary3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            FlutterSwitch(
              width: 56.w,
              height: 32.h,
              toggleSize: 28.h,
              borderRadius: 32.r,
              padding: 2.h,
              activeColor: AppColors.primaryBase6,
              inactiveColor: AppColors.tertiary3,
              activeToggleColor: AppColors.primary2,
              inactiveToggleColor: AppColors.tertiary1,
              value: toggle ?? false,
              onToggle: onChanged ?? (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
