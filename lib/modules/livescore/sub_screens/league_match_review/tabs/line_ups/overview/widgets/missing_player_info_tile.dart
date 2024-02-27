import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/model/player_model.dart';

import '../../../../../../../../core/theme/colors.dart';

class MissingPlayerInfoTile extends StatelessWidget {
  const MissingPlayerInfoTile({
    Key? key,
    this.isAway = false,
    required this.player,
    // required this.countryCode,
    // required this.playerName,
    // required this.goalCount,
    // required this.isSubstituted,
    // required this.booking,
  }) : super(key: key);

  final bool isAway;
  final PlayerModel player;
  // final String countryCode;
  // final String playerName;
  // final int goalCount;
  // final bool isSubstituted;
  // final String booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isAway ? _playerInfo().reversed.toList() : _playerInfo(),
      ),
    );
  }

  List<Widget> _playerInfo() => [
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: SvgPicture.asset(
            'assets/images/${player.countryCode}.svg',
            width: 22.4.w,
            height: 16.h,
          ),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Column(
            crossAxisAlignment:
                isAway ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                player.playerName,
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 4.h),
              Text(
                player.condition ?? '',
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ];
}
