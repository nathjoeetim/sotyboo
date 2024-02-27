import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../components/league_select.dart';
import '../../../../components/league_table.dart';
import '../../../../components/tableHintTile.dart';
import '../../../league_match_review/tabs/table/components/selectable_table_text.dart';

class TeamTableTab extends StatelessWidget {
  const TeamTableTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.tertiary2,
        child: Column(
          children: [
            const LeagueSelect(),
            Container(
              height: 2.h,
              color: AppColors.tertiary1,
            ),
            Container(
              color: AppColors.tertiary2,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  const SelectableTableText(),
                  SizedBox(height: 16.h),
                  LeagueTable(),
                  SizedBox(height: 16.h),
                  const TableHintTile(
                    color: AppColors.info4,
                    text: 'Promotion - Champions League ( Group State)',
                  ),
                  const TableHintTile(
                    color: AppColors.danger4,
                    text: 'Promotion - Europa League ( Group State)',
                  ),
                  const TableHintTile(
                    color: AppColors.dangerBase3,
                    text: 'Promotion - Championship',
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'If teams finish on equal points at the end of the season, score difference will be the tie-breaker.',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.tertiary8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
