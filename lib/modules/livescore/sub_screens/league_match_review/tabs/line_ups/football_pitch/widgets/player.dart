import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';
import '../../model/player_model.dart';
import '../../overview/widgets/player_info_tile.dart';

class Player extends StatelessWidget {
  const Player({
    Key? key,
    required this.isAway,
    required this.player,
/*    required this.playerName,
    required this.playerNumber,
    required this.goals,
    required this.booking,
    required this.isSubstituted,
    required this.isReceivingTreatment,*/
  }) : super(key: key);

  final bool isAway;
  final PlayerModel player;
/*  final String playerName;
  final String playerNumber;
  final int goals;
  final String? booking;
  final bool isSubstituted;
  final bool isReceivingTreatment;*/

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isAway ? pi : 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Player Info
          SizedBox(
            width: 44.w, //40 + 4 for Goal Number 'left'
            height: 44.h, //32 + 4 + 4 for Goal Number 'top' and card 'bottom'
            child: Stack(
              children: [
                // Player Circle
                Positioned(
                  top: 8.h,
                  bottom: 4.h,
                  left: 8.w,
                  right: 4.w,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor:
                        isAway ? AppColors.tertiary1 : AppColors.tertiary11,
                    child: Text(
                      player.playerNumber,
                      style: TextStyle(
                        color:
                            isAway ? AppColors.tertiary11 : AppColors.tertiary1,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // Goal
                Positioned(
                  top: 4.h,
                  left: 4.h,
                  child: Visibility(
                    visible: player.goals > 0,
                    child: SvgPicture.asset(
                      'assets/svgs/ball-second.svg',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
                // Goal Number
                Positioned(
                  top: 0.h,
                  left: 0.h,
                  child: Visibility(
                    visible: player.goals > 1,
                    child: CircleAvatar(
                      radius: 7.r,
                      backgroundColor: AppColors.dangerBase3,
                      child: Text(
                        player.goals.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.tertiary1,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                //Booking
                Positioned(
                  bottom: 0.h,
                  left: 4.w,
                  child: Visibility(
                    visible: player.booking != null,
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundColor: AppColors.tertiary1,
                      child: player.booking != null
                          ? Booking(cardType: player.booking!)
                          : Container(),
                    ),
                  ),
                ),
                // Substitution
                Positioned(
                  top: 4.h,
                  right: 0.h,
                  child: Visibility(
                    visible: player.isSubstituted,
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundColor: AppColors.tertiary1,
                      child: SvgPicture.asset(
                        'assets/svgs/substitution-second.svg',
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.h,
                  bottom: 0.h,
                  child: Visibility(
                    visible: player.isReceivingTreatment,
                    child: SvgPicture.asset(
                      'assets/svgs/treatment.svg',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Name
          Text(
            player.playerName,
            textScaleFactor: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
