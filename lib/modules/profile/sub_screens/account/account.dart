import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/profile/components/custom_app_bar.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_card_list.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_list_tile.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/change_password/change_password_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/contact_details/contact_details_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/preferences/preferences_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/residential_address/residential_address_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/account_verification_screen.dart';

import '../../../../core/theme/colors.dart';
import '../../../../unils/navigation.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Account'),
            Expanded(
              child: Container(
                color: AppColors.tertiary0,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    const AccountTiles(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTiles extends StatelessWidget {
  const AccountTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileCardList(
      cardTiles: [
        ProfileListTile(
          title: 'Contact Details',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const ContactDetailsScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Residential Address',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const ResidentialAddressScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Preference',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const PreferencesScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Password',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const ChangePasswordScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Verification',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const AccountVerificationScreen(),
            );
          },
        ),
      ],
    );
  }
}
