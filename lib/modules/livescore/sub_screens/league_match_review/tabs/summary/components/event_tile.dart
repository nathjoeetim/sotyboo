import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/model/event.dart';

import '../../../../../../../core/theme/colors.dart';

enum EventType {
  goal,
  penaltyGoal,
  penaltyMissed,
  yellowCard,
  redCard,
  substitution,
}

class EventTile extends StatelessWidget {
  const EventTile({
    Key? key,
    required this.event,
/*    required this.eventType,
    required this.time,
    required this.isAway,
    required this.title,
    required this.subtitle,
    required this.score,*/
  }) : super(key: key);

  final Event event;

/*
  final EventType eventType;
  final bool isAway;
  final String time;
  final String title;
  final String? subtitle;
  final String? score;
*/

  @override
  Widget build(BuildContext context) {
    //late String icon;
    late Widget icon;
    late bool showSubtitle;
    late bool showScore;

    EventType eventType = event.eventType;

    if (eventType == EventType.goal) {
      //icon = 'ball-plain';
      icon = SvgPicture.asset('assets/svgs/ball.svg');
      showSubtitle = true;
      showScore = true;
    } else if (eventType == EventType.penaltyGoal) {
      //icon = 'timer';
      icon = SvgPicture.asset('assets/svgs/ball.svg');
      showSubtitle = true;
      showScore = true;
    } else if (eventType == EventType.penaltyMissed) {
      //icon = 'timer.svg';
      icon = Container(
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: SvgPicture.asset('assets/svgs/warning.svg'),
      );
      showSubtitle = true;
      showScore = false;
    } else if (eventType == EventType.yellowCard) {
      //icon = 'warning.svg';
      icon = Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: SvgPicture.asset('assets/svgs/booking.svg'),
      );
      showSubtitle = false;
      showScore = false;
    } else if (eventType == EventType.redCard) {
      //icon = 'flag';
      icon = Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: SvgPicture.asset(
          'assets/svgs/booking.svg',
          color: AppColors.dangerBase3,
        ),
      );
      showSubtitle = false;
      showScore = false;
    } else if (eventType == EventType.substitution) {
      //icon = 'info';
      icon = Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: SvgPicture.asset('assets/svgs/substitution-second.svg'),
      );
      showSubtitle = false;
      showScore = false;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          // Time
          Text(
            event.time,
            style: TextStyle(
              color: AppColors.tertiary6,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Row(
              mainAxisAlignment: event.isAway
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: event.isAway
                  ? _eventInfo(
                      icon: icon,
                      showSubtitle: showSubtitle,
                      showScore: showScore,
                    ).reversed.toList()
                  : _eventInfo(
                      icon: icon,
                      showSubtitle: showSubtitle,
                      showScore: showScore,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _eventInfo({
    //required String icon,
    required Widget icon,
    required bool showSubtitle,
    required bool showScore,
  }) {
    late String subtitile;

    if (event.eventType == EventType.penaltyGoal) {
      subtitile = 'Penalty';
    } else if (event.eventType == EventType.penaltyMissed) {
      subtitile = 'Penalty missed';
    } else {
      subtitile = event.subtitle ?? '';
    }

    return [
      Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: TextStyle(
                color: AppColors.tertiary11,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            showSubtitle ? SizedBox(height: 4.h) : const SizedBox.shrink(),
            showSubtitle
                ? Text(
                    '($subtitile)',
                    style: TextStyle(
                      color: AppColors.tertiary6,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : const SizedBox.shrink(),
            /*Text(
                playerName,
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
                overflow: TextOverflow.fade,
              ),*/
          ],
        ),
      ),
      SizedBox(width: 8.w),
      // Icon
      SizedBox(height: 24.h, width: 24.w, child: icon),
      //SvgPicture.asset('assets/svgs/$icon.svg'),
      SizedBox(width: 24.w),
      showScore
          ? Text(
              event.score ?? '',
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          : const SizedBox.shrink(),
    ];
  }
}
