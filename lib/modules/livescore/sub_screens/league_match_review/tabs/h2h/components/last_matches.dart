import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../components/result.dart';

class LastMatchesWidget extends StatelessWidget {
  const LastMatchesWidget({
    super.key,
    required this.time,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.resultType,
  });

  final String time;
  final String homeTeam;
  final String awayTeam;
  final String homeTeamScore;
  final String awayTeamScore;
  final ResultType resultType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border(
          top: BorderSide(
            width: 1.w,
            color: AppColors.tertiary3,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      //padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.tertiaryBase10,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _club(club: homeTeam),
                SizedBox(height: 8.h),
                _club(club: awayTeam),
              ],
            ),
          ),
          Row(
            children: [
              // Score
              Column(
                children: [
                  Text(
                    homeTeamScore,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: AppColors.tertiary11,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    awayTeamScore,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: AppColors.tertiary11,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 25.w),
              //Star
              Result(
                resultType: resultType,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _club({required String club}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Avatar(
            radius: 12.r,
            avatarType: AvatarType.thin,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            club,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
        ],
      );
}
