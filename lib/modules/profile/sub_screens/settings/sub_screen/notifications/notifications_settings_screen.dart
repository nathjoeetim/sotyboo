import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/bottom_sheets/bet_updates_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/bottom_sheets/bookie_alerts_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/bottom_sheets/product_updates_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/bottom_sheets/security_alert_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/bottom_sheets/wallet_activities_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class NotificationsSettingsScreen extends HookWidget {
  const NotificationsSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Add your initialization logic here
      Provider.of<NotificationsSettingsViewmodel>(context, listen: false)
          .initialize();

      // Cleanup function (optional)
      return () {
        // Add cleanup logic here (if needed)
      };
    }, []);

    return CustomScaffold(
      title: 'Notifications',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleBar(),
            const NotificationSettingTiles(),
            Container(
              height: 67.h,
              color: AppColors.tertiary1,
            ),
          ],
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeaderText(text: 'Notification Preferences'),
          SizedBox(height: 8.h),
          Text(
            'Choose how you want to be notified.',
            style: TextStyle(
              color: AppColors.tertiary8,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.20,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationSettingTiles extends StatelessWidget {
  const NotificationSettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsSettingsViewmodel>(
      builder: (context, model, child) {
        return Column(
          children: [
            NotificationSettingTile(
              title: 'Wallet Activities',
              description: 'Push, SMS, Emails',
              onPressed: () => onWalletActivitiesPressed(context: context),
            ),
            NotificationSettingTile(
              title: 'Security Alerts',
              description: 'Push, SMS, Emails',
              onPressed: () => onSecurityAlertsPressed(context: context),
            ),
            NotificationSettingTile(
              title: 'Match Alerts',
              description: 'Get notified for the different match events',
              toggle: model.matchAlerts,
              onChanged: (value) => model.matchAlerts = value,
            ),
            NotificationSettingTile(
              title: 'Bet Updates',
              description: 'Push, SMS, Emails',
              onPressed: () => onBetUpdatesPressed(context: context),
            ),
            NotificationSettingTile(
              title: 'Bookie Alerts',
              description: 'Emails and Push Alerts',
              onPressed: () => onBookieAlertsPressed(context: context),
            ),
            NotificationSettingTile(
              title: 'Promotions',
              description: 'Offers and promotions from SiuuuSport',
              toggle: model.promotions,
              onChanged: (value) => model.promotions = value,
            ),
            NotificationSettingTile(
              title: 'Product Updates',
              description: 'Push, SMS, Emails',
              onPressed: () => onProductUpdatesPressed(context: context),
            ),
          ],
        );
      },
    );
  }
}

class NotificationSettingTile extends StatelessWidget {
  const NotificationSettingTile({
    Key? key,
    required this.title,
    required this.description,
    this.onPressed,
    this.toggle,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback? onPressed;
  final bool? toggle;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Call onChanged callback to update the toggle value
        if (onChanged != null) {
          onChanged!(!toggle!);
        } else {
          onPressed?.call();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiaryBase10.withOpacity(0.08),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.tertiaryBase10,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.tertiary8,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            trailing(),
          ],
        ),
      ),
    );
  }

  Widget trailing() {
    if (toggle == null) {
      return SvgPicture.asset(
        'assets/svgs/arrow-right.svg',
        height: 20.h,
        width: 20.w,
        color: AppColors.tertiaryBase10,
      );
    } else {
      return FlutterSwitch(
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
      );
    }
  }
}
