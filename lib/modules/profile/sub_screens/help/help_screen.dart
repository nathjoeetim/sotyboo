import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_card_list.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_list_tile.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Help & Support',
      child: Column(
        children: [
          SizedBox(height: 24.h),
          const HelpTiles(),
        ],
      ),
    );
  }
}

class HelpTiles extends StatelessWidget {
  const HelpTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileCardList(
      bigPadding: true,
      cardTiles: [
        ProfileListTile(
          title: 'Contact Us',
          onPressed: () {
            /*PageRouter.gotoWidget(
              context,
              const ContactDetailsScreen(),
            );*/
          },
        ),
        ProfileListTile(
          title: 'FAQ',
          onPressed: () {
            /*PageRouter.gotoWidget(
              context,
              const ResidentialAddressScreen(),
            );*/
          },
        ),
      ],
    );
  }
}
