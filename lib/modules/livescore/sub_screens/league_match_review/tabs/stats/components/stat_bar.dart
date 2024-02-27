import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class StatBar extends StatelessWidget {
  final int homeTeamWinCount;
  final int awayTeamWinCount;

  const StatBar({
    Key? key,
    required this.homeTeamWinCount,
    required this.awayTeamWinCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalWinCount = homeTeamWinCount + awayTeamWinCount;

    return Row(
      children: [
        _buildTeamBar(homeTeamWinCount, totalWinCount, false),
        SizedBox(width: 8.h),
        _buildTeamBar(awayTeamWinCount, totalWinCount, true),
      ],
    );
  }

  Widget _buildTeamBar(
    int winCount,
    int totalWinCount,
    bool isAway,
  ) {
    final double barPercentage =
        totalWinCount > 0 ? winCount / totalWinCount : 0.0;

    late Color barColor;

    if (winCount == 0) {
      barColor = Colors.transparent;
    } else if (barPercentage >= 0.5) {
      barColor = AppColors.successBase3;
    } else {
      barColor = AppColors.dangerBase3;
    }

    return Expanded(
      flex: 1,
      child: Container(
        height: 8.h,
        decoration: BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: FractionallySizedBox(
          alignment: isAway ? Alignment.centerLeft : Alignment.centerRight,
          widthFactor: barPercentage,
          child: Container(
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
      ),
    );
  }
}
