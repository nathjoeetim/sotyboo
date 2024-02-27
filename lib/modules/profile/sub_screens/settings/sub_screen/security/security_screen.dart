import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/change_password/change_password_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/bottom_sheets/biometric_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/bottom_sheets/disable_account_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/bottom_sheets/two_fa_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/change_pin/change_pin_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

import '../../../../../../unils/navigation.dart';

class SecurityScreen extends HookWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Add your initialization logic here
      Provider.of<SecurityViewmodel>(context, listen: false).initialize();

      // Cleanup function (optional)
      return () {
        // Add cleanup logic here (if needed)
      };
    }, []);

    return CustomScaffold(
      title: 'Security',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleBar(),
            const SecurityTiles(),
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
      padding: EdgeInsets.all(24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeaderText(text: 'Security Preferences'),
          SizedBox(height: 8.h),
          Text(
            'Add extra of protection to your account.',
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

class SecurityTiles extends StatelessWidget {
  const SecurityTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityViewmodel>(
      builder: (context, model, child) {
        return Column(
          children: [
            SecurityTile(
              title: '2-Step Verification',
              description: 'Multi-factor authentication',
              onPressed: () {
                onTwoFaPressed(context: context);
              },
              toggle: model.twoFAToggle,
              onChanged: (value) => model.twoFAToggle = value,
            ),
            SecurityTile(
              title: 'Change Password',
              description: 'Create a New Password',
              onPressed: () {
                PageRouter.gotoWidget(
                  context,
                  const ChangePasswordScreen(),
                );
              },
            ),
            SecurityTile(
              title: 'Change PIN',
              description: 'Create a New 4 Digit PIN',
              onPressed: () {
                PageRouter.gotoWidget(
                  context,
                  const ChangePinScreen(),
                );
              },
            ),
            SecurityTile(
              title: 'Enable Biometric Unlock',
              description: 'Fingerprint Access',
              onPressed: () {
                onBiometricPressed(context: context);
              },
              toggle: model.biometricToggle,
              onChanged: (value) => model.biometricToggle = value,
            ),
            SecurityTile(
              title: 'Enable Screenshots',
              description: 'Secure account',
              /*onPressed: () {
                ////////
              },*/
              toggle: model.enableScreenShotsToggle,
              onChanged: (value) => model.enableScreenshotsToggle = value,
            ),
            SecurityTile(
              title: 'Disable Account',
              description: 'Delete account',
              onPressed: () {
                onDisableAccountPressed(context: context);
              },
            ),
          ],
        );
      },
    );
  }
}

class SecurityTile extends StatelessWidget {
  const SecurityTile({
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
      onTap: onPressed,
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
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
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
