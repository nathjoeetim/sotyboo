import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/components/stat_bar.dart';

import '../../../../../../../core/theme/colors.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    Key? key,
    required this.title,
    required this.homeTeamWinCount,
    required this.awayTeamWinCount,
  }) : super(key: key);

  final String title;
  final int homeTeamWinCount;
  final int awayTeamWinCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 16.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _numberText(
                text: homeTeamWinCount.toString(),
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _numberText(
                text: awayTeamWinCount.toString(),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          StatBar(
            homeTeamWinCount: homeTeamWinCount,
            awayTeamWinCount: awayTeamWinCount,
          ),
        ],
      ),
    );
  }

  Widget _numberText({required String text}) => Text(
        text,
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      );
}
