import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/model/player_model.dart';

import '../../../../../../../../core/theme/colors.dart';

class PlayerInfoTile extends StatelessWidget {
  const PlayerInfoTile({
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
        children: isAway ? _playerInfo().reversed.toList() : _playerInfo(),
      ),
    );
  }

  List<Widget> _playerInfo() => [
        SvgPicture.asset(
          'assets/images/${player.countryCode}.svg',
          width: 22.4.w,
          height: 16.h,
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(
            player.playerName,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
            overflow: TextOverflow.fade,
          ),
        ),
        player.goals > 0 ? SizedBox(width: 4.w) : const SizedBox.shrink(),
        // Goal
        Goal(goalCount: player.goals),
        player.isSubstituted ? SizedBox(width: 4.w) : const SizedBox.shrink(),
        // Substitution
        player.isSubstituted
            ? SvgPicture.asset(
                'assets/svgs/substitution.svg',
                height: 18.h,
                width: 18.w,
              )
            : const SizedBox.shrink(),
        if (player.booking == '') SizedBox(width: 4.w),
        // Card
        Booking(cardType: player.booking ?? ''),
      ];
}

class Goal extends StatelessWidget {
  const Goal({
    Key? key,
    required this.goalCount,
  }) : super(key: key);
  final int goalCount;

  @override
  Widget build(BuildContext context) {
    if (goalCount == 0) {
      return const SizedBox.shrink();
    } else if (goalCount == 1) {
      return SvgPicture.asset(
        'assets/svgs/ball.svg',
        height: 18.h,
        width: 18.w,
      );
    } else {
      return SizedBox(
        width: 18.95.w,
        height: 18.h,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/svgs/ball.svg',
                height: 15.16.h,
                width: 15.16.w,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: CircleAvatar(
                radius: 6.63.r,
                backgroundColor: AppColors.dangerBase3,
                child: Text(
                  goalCount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8.sp,
                    color: AppColors.tertiary1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class Booking extends StatelessWidget {
  const Booking({
    Key? key,
    required this.cardType,
  }) : super(key: key);

  final String cardType;

  @override
  Widget build(BuildContext context) {
    if (cardType == 'yellow') {
      return SvgPicture.asset(
        'assets/svgs/booking.svg',
        height: 16.h,
        width: 16.w,
      );
    } else if (cardType == 'red') {
      return SvgPicture.asset(
        'assets/svgs/booking.svg',
        height: 16.h,
        width: 16.w,
        color: AppColors.dangerBase3,
      );
    } else if (cardType == 'yellow-red') {
      return SizedBox(
        width: 22.w,
        height: 16.w,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: SvgPicture.asset(
                'assets/svgs/booking.svg',
                height: 16.h,
                width: 16.w,
              ),
            ),
            Positioned(
              right: 0,
              child: SvgPicture.asset(
                'assets/svgs/booking.svg',
                height: 16.h,
                width: 16.w,
                color: AppColors.dangerBase3,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
