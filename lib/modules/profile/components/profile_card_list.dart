import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/components/line.dart';
import 'package:sportboo_mobile_client/modules/profile/components/profile_list_tile.dart';

import '../../../core/theme/colors.dart';

class ProfileCardList extends StatelessWidget {
  const ProfileCardList({
    Key? key,
    this.bigPadding = false,
    required this.cardTiles,
  }) : super(key: key);

  final bool bigPadding;
  final List<ProfileListTile> cardTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.tertiary1,
        boxShadow: [
          BoxShadow(
            color: AppColors.tertiaryBase10.withOpacity(0.08),
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: List.generate(
          cardTiles.length,
          (index) => Column(
            children: [
              ProfileListTile(
                title: cardTiles[index].title,
                bigPadding: bigPadding,
                onPressed: cardTiles[index].onPressed,
              ),
              if (index < cardTiles.length - 1) const Line(),
            ],
          ),
        ),
      ),
    );
  }
}
