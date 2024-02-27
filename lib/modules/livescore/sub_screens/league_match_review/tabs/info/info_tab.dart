import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../components/table.dart';
import '../../../../../../core/theme/colors.dart';
import 'components/first_half_winner.dart';
import 'components/first_to_score.dart';
import 'components/last_result_card.dart';
import 'components/match_info_card.dart';
import 'components/p2p_card.dart';
import 'components/second_half_winner.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const P2PCard(),
            SizedBox(height: 16.h),
            const MatchInfoCard(),
            _tileHeader(title: 'Last results'),
            const LastResultCard(),
            _tileHeader(title: 'Table'),
            PremierLeagueTable(seeAllText: true),
            _tileScoreHeader(title: '1st Half Winner', score: '2:0'),
            const HalfWinner(),
            _tileScoreHeader(title: '2st Half Winner', score: '2:2'),
            const SecondHalfWinner(),
            _tileHeader(title: '1st to Score'),
            const FirstToScore(),
            SizedBox(height: 53.h),
          ],
        ),
      ),
    );
  }

  Widget _tileHeader({required String title}) => Container(
        margin: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.tertiary8,
              ),
            ),
            SvgPicture.asset(
              'assets/svgs/arrow-right.svg',
              width: 16.w,
              height: 16.w,
              color: AppColors.tertiary9,
            ),
          ],
        ),
      );

  Widget _tileScoreHeader({required String title, required String score}) =>
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.tertiary8,
              ),
            ),
            Text(
              score,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.tertiaryBase10,
              ),
            ),
          ],
        ),
      );
}
