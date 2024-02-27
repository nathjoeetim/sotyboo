import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../components/my_expansion_tile.dart';
import '../../../../components/result.dart';
import 'components/filter_chip.dart';
import 'components/last_matches.dart';
import 'components/matchStats.dart';

class H2hTab extends StatelessWidget {
  H2hTab({Key? key}) : super(key: key);

  double rating = 4; // Replace with the actual rating value

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.tertiary2,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // Chips
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    FilterChipWidget(
                      text: 'OVERALL',
                      isActive: true,
                    ),
                    FilterChipWidget(
                      text: 'MCI - HOME',
                      isActive: false,
                    ),
                    FilterChipWidget(
                      text: 'MNU - AWAY',
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            _stats(),
            SizedBox(
              height: 24.h,
            ),

            // Home team
            const MyExpansionTile(
              title: 'Last matches: Manchester City',
              children: [
                LastMatchesWidget(
                  time: '17.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '3',
                  resultType: ResultType.win,
                ),
                LastMatchesWidget(
                  time: '14.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '2',
                  awayTeamScore: '1',
                  resultType: ResultType.loss,
                ),
                LastMatchesWidget(
                  time: '06.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '1',
                  awayTeamScore: '1',
                  resultType: ResultType.draw,
                ),
                LastMatchesWidget(
                  time: '31.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '6',
                  resultType: ResultType.win,
                ),
              ],
            ),
            // Away team
            const MyExpansionTile(
              title: 'Last matches: Manchester Utd',
              children: [
                LastMatchesWidget(
                  time: '17.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '3',
                  resultType: ResultType.win,
                ),
                LastMatchesWidget(
                  time: '14.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '2',
                  awayTeamScore: '1',
                  resultType: ResultType.loss,
                ),
                LastMatchesWidget(
                  time: '06.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '1',
                  awayTeamScore: '1',
                  resultType: ResultType.draw,
                ),
                LastMatchesWidget(
                  time: '31.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '6',
                  resultType: ResultType.win,
                ),
              ],
            ),
            // Heat to Head
            const MyExpansionTile(
              title: 'Head-to-head matches',
              children: [
                LastMatchesWidget(
                  time: '17.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '3',
                  resultType: ResultType.win,
                ),
                LastMatchesWidget(
                  time: '14.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '2',
                  awayTeamScore: '1',
                  resultType: ResultType.loss,
                ),
                LastMatchesWidget(
                  time: '06.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '1',
                  awayTeamScore: '1',
                  resultType: ResultType.draw,
                ),
                LastMatchesWidget(
                  time: '31.09.',
                  homeTeam: 'wolves',
                  awayTeam: 'Manchester City',
                  homeTeamScore: '0',
                  awayTeamScore: '6',
                  resultType: ResultType.win,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stats() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                left: 16.w,
                bottom: 8.h,
              ),
              child: Text(
                'All matches',
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.tertiary3,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                left: 16.w,
                right: 16.w,
                bottom: 12.h,
              ),
              child: MatchStats(
                homeTeamWinCount: 33,
                drawCount: 3,
                awayTeamWinCount: 22,
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.tertiary3,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                left: 16.w,
                bottom: 8.h,
              ),
              child: Text(
                'Last 5 matches',
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.tertiary3,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 12.h,
                left: 16.h,
                right: 16.h,
              ),
              child: MatchStats(
                homeTeamWinCount: 33,
                drawCount: 33,
                awayTeamWinCount: 33,
              ),
            ),
          ],
        ),
      );

  _getColor(double rating) {
    if (rating >= 4) {
      return const AlwaysStoppedAnimation<Color>(Colors.green);
    } else if (rating >= 2) {
      return const AlwaysStoppedAnimation<Color>(Colors.yellow);
    } else {
      return const AlwaysStoppedAnimation<Color>(Colors.red);
    }
  }
}
