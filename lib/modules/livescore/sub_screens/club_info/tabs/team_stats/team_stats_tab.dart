import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../components/league_select.dart';
import '../player_stats/components/select_player_stat.dart';
import 'components/team_stats_table.dart';

class TeamStats extends StatelessWidget {
  TeamStats({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> stats = [
    {
      'stats': 'Average ball possession',
      'perGame': '-',
      'total': '53%',
      'rank': 21,
    },
    {
      'stats': 'Goal scored',
      'perGame': 1.5,
      'total': 17,
      'rank': 21,
    },
    {
      'stats': 'Goal scored 1st half',
      'perGame': 0.5,
      'total': 17,
      'rank': 21,
    },
    {
      'stats': 'Goal scored 2nd half',
      'perGame': 5,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Goal by foot',
      'perGame': 12.3,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Goal by head',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Penalty missed',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Shots',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Shots on target',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Shots off target',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Shots on bar',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Shots on post',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Offsides',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Corner Kicks',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
    {
      'stats': 'Free Kicks',
      'perGame': 34,
      'total': 44,
      'rank': 80,
    },
  ];

  final List<Map<String, dynamic>> defendingStats = [
    {
      'stats': 'Goals conceded',
      'perGame': '1.3',
      'total': '2',
      'rank': 21,
    },
    {
      'stats': 'Goals conceded 1st half',
      'perGame': 2.2,
      'total': '5',
      'rank': 21,
    },
    {
      'stats': 'Goals conceded 2nd half',
      'perGame': 0.73,
      'total': '3',
      'rank': 21,
    },
  ];

  final List<Map<String, dynamic>> disciplineStats = [
    {
      'stats': 'Red cards',
      'perGame': '1.3',
      'total': '2',
      'rank': 21,
    },
    {
      'stats': 'Yellow cards',
      'perGame': 2.2,
      'total': '5',
      'rank': 21,
    },
    {
      'stats': 'Total cards',
      'perGame': 0.73,
      'total': '3',
      'rank': 21,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        color: AppColors.tertiary2,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                color: AppColors.tertiary1,
                child: const SelectablePlayerStatText()),
            SizedBox(height: 8.h),
            const LeagueSelect(),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TeamStatsTable(
                stats: stats,
                title: 'Attacking'.toUpperCase(),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TeamStatsTable(
                stats: defendingStats,
                title: 'Defending'.toUpperCase(),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TeamStatsTable(
                stats: disciplineStats,
                title: 'DISCIPLINE',
              ),
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
