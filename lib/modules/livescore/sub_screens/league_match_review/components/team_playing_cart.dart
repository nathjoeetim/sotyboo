import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/avatar.dart';
import '../../../../../core/theme/colors.dart';
import '../../club_info/club_info_screen.dart';

class PlayingTeamCard extends StatelessWidget {
  const PlayingTeamCard({super.key, this.addMargin = true});

  final bool addMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: addMargin
          ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.tertiary1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _club(press: () => Get.to(() => const ClubInfoScreen())),
          _dateAndTime(),
          _club(press: () {}),
        ],
      ),
    );
  }

  Widget _dateAndTime() => Column(
        children: [
          Text(
            '15:30',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'Today',
            style: TextStyle(fontSize: 10.sp, color: AppColors.tertiary8),
          )
        ],
      );

  Widget _club({required Function() press}) => GestureDetector(
        onTap: press,
        child: Column(
          children: [
            const Avatar(radius: 20),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'Manchester City',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
}
