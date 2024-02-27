import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_card_list.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_list_tile.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/about/sub_screens/about_us_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/about/sub_screens/privacy_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/about/sub_screens/terms_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';

import '../../../../../../unils/navigation.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'About',
      child: Column(
        children: [
          SizedBox(height: 24.h),
          const AboutTiles(),
        ],
      ),
    );
  }
}

class AboutTiles extends StatelessWidget {
  const AboutTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileCardList(
      bigPadding: true,
      cardTiles: [
        ProfileListTile(
          title: 'About Us',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const AboutUsScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Terms of Use',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const TermsScreen(),
            );
          },
        ),
        ProfileListTile(
          title: 'Privacy Policy',
          onPressed: () {
            PageRouter.gotoWidget(
              context,
              const PrivacyScreen(),
            );
          },
        ),
      ],
    );
  }
}
