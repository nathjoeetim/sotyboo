import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/back.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/favourite/favourite_page.dart';
import 'package:sportboo_mobile_client/modules/profile/components/VerificationStatus.dart';
import 'package:sportboo_mobile_client/modules/profile/components/accountId.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/account.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/activities_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/help/help_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/messaging_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/notification_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/reward_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/setting_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/share_app/invite_friends_bottom_sheet.dart';

import '../../core/theme/colors.dart';
import '../../unils/navigation.dart';
import '../../unils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            TopBar(),
            // Details bar
            DetailsBar(),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  // Tiles
                  ProfileTiles(),
                  // Logout
                  LogoutBar(),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Back(),
          SizedBox(width: 24.w),
          Text(
            'Profile',
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.h,
                color: AppColors.tertiary3,
              ),
              borderRadius: BorderRadius.circular(36.r),
            ),
            child: Text(
              'N2000.00',
              style: TextStyle(
                color: AppColors.tertiary11,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsBar extends StatelessWidget {
  const DetailsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            getSvg('user_icon'),
            height: 64.h,
            width: 64.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username:',
                  style: TextStyle(
                    color: AppColors.tertiary8,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Emmanuel.jake',
                  style: TextStyle(
                    color: AppColors.tertiaryBase10,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AccountId(),
                    SizedBox(width: 8.h),
                    const VerificationStatus(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 5.h,
                color: AppColors.tertiary3,
              ),
            ),
          ),
          child: ProfileTile(
            icon: 'person',
            title: 'Account',
            onPressed: () {
              PageRouter.gotoWidget(
                context,
                const AccountScreen(),
              );
            },
          ),
        ),
        ProfileTile(
          icon: 'my-bets-icon',
          title: 'My bets',
          onPressed: () {
            /*PageRouter.gotoWidget(
              context,
              const MyBetScreen(),
            );*/
          },
        ),
        ProfileTile(
          icon: 'bookie-icon',
          title: 'Bookie',
          onPressed: () {
            /*PageRouter.gotoWidget(
              context,
              const BookieScreen(),
            );*/
          },
        ),
        ProfileTile(
          icon: 'star-list',
          title: 'Favorites',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const FavouritePage(),
            );
          },
        ),
        _line(),
        Consumer<MessagingViewmodel>(
          builder: (context, model, child) {
            return ProfileTile(
              icon: 'sms-tracking',
              title: 'Messages',
              count: model.newChatLength.toString(),
              onPressed: () {
                PageRouter.gotoWidget(
                  context,
                  MessagingScreen(),
                );
              },
            );
          },
        ),
        Consumer<NotificationsViewmodel>(
          builder: (context, model, child) {
            return ProfileTile(
              icon: 'notification-bell',
              title: 'Notifications',
              count: model.newNotificationsLength.toString(),
              onPressed: () {
                PageRouter.gotoWidget(
                  context,
                  NotificationScreen(),
                );
              },
            );
          },
        ),
        ProfileTile(
          icon: 'task-square',
          title: 'Activities',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              ActivitiesScreen(),
            );
          },
        ),
        _line(),
        ProfileTile(
          icon: 'gift',
          title: 'Rewards',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              RewardScreen(),
            );
          },
        ),
        ProfileTile(
          icon: 'setting-2',
          title: 'Settings',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const SettingsScreen(),
            );
          },
        ),
        ProfileTile(
          icon: '24-support',
          title: 'Help & Support',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const HelpScreen(),
            );
          },
        ),
        ProfileTile(
          icon: 'share',
          title: 'Share the app',
          onPressed: () => onInviteFriendsPressed(context: context),
        ),
        _line(),
      ],
    );
  }

  Widget _line() => Divider(
        height: 0,
        thickness: 6.h,
        color: AppColors.tertiary3,
      );
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.icon,
    required this.title,
    this.count,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final String title;
  final String? count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.h,
              color: AppColors.tertiary3,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/$icon.svg',
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (count != null && count != '0')
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: AppColors.dangerBase3,
                ),
                child: Text(
                  count ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            SizedBox(width: 16.w),
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

class LogoutBar extends StatelessWidget {
  const LogoutBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      child: GestureDetector(
        onTap: () {
          log('Logging out...');
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.tertiary5,
          ),
          alignment: Alignment.center,
          child: Text(
            'Logout',
            style: TextStyle(
              color: AppColors.tertiary1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
