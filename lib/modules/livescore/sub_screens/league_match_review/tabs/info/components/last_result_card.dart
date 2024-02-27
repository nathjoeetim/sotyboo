import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../components/result.dart';

class LastResultCard extends StatelessWidget {
  const LastResultCard({super.key, this.showSecondTeam = true});

  final bool showSecondTeam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border.all(
          width: 1.h,
          color: AppColors.tertiary3,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Manchester City',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: AppColors.tertiaryBase10,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: const Result(resultType: ResultType.win),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) => _score()),
            ),
          ),
          showSecondTeam
              ? Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manchester United',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            color: AppColors.tertiaryBase10,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child:
                                    const Result(resultType: ResultType.draw),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) => _score()),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _score() => Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary3,
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary4,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(
              radius: 12.r,
              avatarType: AvatarType.thin,
            ),
            SizedBox(width: 4.w),
            Text(
              '0:1',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.tertiaryBase10,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 4.w),
            Avatar(
              radius: 12.r,
              avatarType: AvatarType.thin,
            ),
          ],
        ),
      );
}
