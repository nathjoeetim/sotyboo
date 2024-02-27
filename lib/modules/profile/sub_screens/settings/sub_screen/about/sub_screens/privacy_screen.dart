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
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/widgets/notification_setting_bottom_sheet_container.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/model/notification_setting_multitoggle.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/change_pin/change_pin_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class PrivacyScreen extends HookWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Privacy',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              const ProfileHeaderText(text: 'Privacy Notice - Sportboo'),
              SizedBox(height: 24.h),
              Text(
                'Last updated: 29 September 2022',
                style: TextStyle(
                  color: AppColors.tertiary6,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              ),
              SizedBox(height: 24.h),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        color: Color(0xFF474747),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                      ),
                    ),
                    TextSpan(
                      text: '\n\nWhere does it come from?\n\n',
                      style: TextStyle(
                        color: Color(0xFF474747),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n',
                      style: TextStyle(
                        color: Color(0xFF474747),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                      ),
                    ),
                  ],
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
