import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class MatchStats extends StatelessWidget {
  MatchStats(
      {Key? key,
      required this.homeTeamWinCount,
      required this.drawCount,
      required this.awayTeamWinCount})
      : super(key: key);

  final int homeTeamWinCount, drawCount, awayTeamWinCount;

  @override
  Widget build(BuildContext context) {
    // Calculate the flex values
    final int totalFlex = homeTeamWinCount + drawCount + awayTeamWinCount;
    final double minFlex = totalFlex * 0.25;
    final double homeTeamWinFlex =
        (homeTeamWinCount >= minFlex) ? homeTeamWinCount.toDouble() : minFlex;
    final double drawFlex =
        (drawCount >= minFlex) ? drawCount.toDouble() : minFlex;
    final double awayTeamWinFlex =
        (awayTeamWinCount >= minFlex) ? awayTeamWinCount.toDouble() : minFlex;

    return Row(
      children: [
        _flex(
          count: homeTeamWinCount,
          flex: homeTeamWinFlex.toInt(),
          isWin: true,
        ),
        SizedBox(width: 24.w),
        _flex(
          count: drawCount,
          flex: drawFlex.toInt(),
          isWin: false,
        ),
        SizedBox(width: 24.w),
        _flex(
          count: awayTeamWinCount,
          flex: awayTeamWinFlex.toInt(),
          isWin: true,
        ),
      ],
    );
  }

  Widget _flex({
    required int count,
    required int flex,
    required bool isWin,
  }) {
    late String label;

    if (count < 2) {
      label = isWin ? 'Win' : 'Draw';
    } else {
      label = isWin ? 'Wins' : 'Draws';
    }

    return Expanded(
      //flex: homeTeamWinFlex!,
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              color: AppColors.tertiary9,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.tertiary7,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 4.h,
            decoration: BoxDecoration(
                color: isWin ? AppColors.successBase3 : AppColors.tertiary4,
                borderRadius: BorderRadius.circular(100.r)),
          ),
        ],
      ),
    );
  }
}
