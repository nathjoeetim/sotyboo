import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import '../overview/components/player_stat_box.dart';
import 'components/select_player_stat.dart';

class PlayerStatsTab extends StatelessWidget {
  const PlayerStatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: AppColors.tertiary2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              color: AppColors.tertiary1,
              child: const SelectablePlayerStatText(),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: const [
                  PlayerStatBox(title: 'GOALS'),
                  PlayerStatBox(title: 'PLAYER RATING'),
                  PlayerStatBox(title: 'ASSISTS'),
                  PlayerStatBox(title: 'PRE-ASSISTS'),
                  PlayerStatBox(title: 'SHOTS ON TARGET'),
                  PlayerStatBox(title: 'YELLOW'),
                  PlayerStatBox(title: 'RED CARDS'),
                  PlayerStatBox(title: 'MAN OF THE MATCH'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
