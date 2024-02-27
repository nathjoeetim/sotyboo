import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../components/avatar.dart';
import '../../../../../../components/table.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../components/sectionTitle.dart';
import '../../../league_match_review/tabs/info/components/last_result_card.dart';
import '../news/model/news.dart';
import '../news/widgets/news_card.dart';
import 'components/player_stat_box.dart';

class OverviewTab extends StatelessWidget {
  OverviewTab({Key? key}) : super(key: key);

  final List<News> news = [
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.tertiary2,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const SectionTitle(title: 'Next Match'),
            _clubsBar(),
            const SectionTitle(title: 'Last results'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: const LastResultCard(
                showSecondTeam: false,
              ),
            ),
            const SectionTitle(title: 'News'),
            ...List.generate(
              news.length,
              (index) => Container(
                margin: index < news.length - 1
                    ? EdgeInsets.only(bottom: 16.h)
                    : EdgeInsets.zero,
                child: NewsCard(
                  news: news[index],
                ),
              ),
            ),
            SizedBox(height: 4.h),
            const SectionTitle(title: 'Top Scorers', showArrow: false),
            const PlayerStatBox(
              addTitle: false,
              title: 'TOP SCORERS',
              addBorder: true,
            ),
            SizedBox(height: 4.h),
            const SectionTitle(title: 'Table', showArrow: false),
            SizedBox(height: 4.h),
            PremierLeagueTable(seeAllText: false),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _clubsBar() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // First Club
            _club(clubName: 'Manchester City'),
            // Time
            _time(),
            // Second club
            _club(clubName: 'Manchester Utd'),
          ],
        ),
      );

  Widget _club({required String clubName}) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(
              radius: 16.r,
              avatarType: AvatarType.thin,
            ),
            SizedBox(height: 8.h),
            Text(
              clubName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                color: AppColors.tertiaryBase10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget _time() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '15:30',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: AppColors.tertiaryBase10,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Today',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColors.tertiary8,
              ),
            ),
          ],
        ),
      );
}
