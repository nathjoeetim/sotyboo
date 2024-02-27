import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/VerificationStatus.dart';
import 'package:sportboo_mobile_client/modules/profile/components/accountId.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/account.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/about/about_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/payment_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../unils/navigation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Settings',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileDetails(),
            const SettingTiles(),
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

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            SvgPicture.asset(
              getSvg('user_icon'),
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(height: 16.h),
            Text(
              'Emmanuel.jake@gmail.com',
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AccountId(
                  isBig: true,
                ),
                SizedBox(width: 16.w),
                const VerificationStatus(
                  isBig: true,
                )
              ],
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                PageRouter.gotoWidget(
                  context,
                  const AccountScreen(),
                );
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      color: AppColors.primaryBase6,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class SettingTiles extends StatelessWidget {
  const SettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTile(
          title: 'Account',
          description: 'Profile, Limits, Preference and more',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const AccountScreen(),
            );
          },
        ),
        SettingTile(
          title: 'Payments',
          description: 'Bank Accounts, Deposits and Withdrawal',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const PaymentScreen(),
            );
          },
        ),
        SettingTile(
          title: 'Notifications',
          description: 'Emails and Push Alerts',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const NotificationsSettingsScreen(),
            );
          },
        ),
        SettingTile(
          title: 'Security',
          description: 'Login Methods, 2FA, Transaction Pin and more',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const SecurityScreen(),
            );
          },
        ),
        SettingTile(
          title: 'About',
          description: 'About Us, Terms and Privacy',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const AboutScreen(),
            );
          },
        ),
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 16.h,
          left: 24.w,
          right: 16.w,
        ),
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
            Column(
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
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SvgPicture.asset(
              'assets/svgs/arrow-right.svg',
              height: 20.h,
              width: 20.w,
              color: AppColors.tertiaryBase10,
            ),
          ],
        ),
      ),
    );
  }
}
