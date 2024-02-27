import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';

class SecondHalfWinner extends StatelessWidget {
  const SecondHalfWinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border.all(
          color: AppColors.tertiary3,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Avatar(
                radius: 12.r,
                avatarType: AvatarType.thin,
              ),
              SizedBox(width: 8.w),
              Text(
                'Manchester City',
                style: TextStyle(
                  color: AppColors.tertiary9,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/ball.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '48\'',
                    style: TextStyle(
                      color: AppColors.tertiaryBase10,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    '(Cancelo J.) ',
                    style: TextStyle(
                      color: AppColors.tertiary8,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    'Haaland E.',
                    style: TextStyle(
                      color: AppColors.tertiary11,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/ball.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '80\'',
                    style: TextStyle(
                      color: AppColors.tertiaryBase10,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    '(Cancelo J.) ',
                    style: TextStyle(
                      color: AppColors.tertiary8,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    'Haaland E.',
                    style: TextStyle(
                      color: AppColors.tertiary11,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
