import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';

class FirstToScore extends StatelessWidget {
  const FirstToScore({super.key});

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
        children: [
          Row(
            children: [
              Avatar(
                radius: 12.r,
                avatarType: AvatarType.thin,
              ),
              SizedBox(width: 8.w),
              Text(
                'Manchester Utd',
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
              Wrap(
                children: [
                  Text(
                    '(Fernandes B.) ',
                    style: TextStyle(
                      color: AppColors.tertiary8,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    'Ronaldo C.',
                    style: TextStyle(
                      color: AppColors.tertiary11,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                SvgPicture.asset(
                  'assets/svgs/ball.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  '24\'',
                  style: TextStyle(
                    color: AppColors.tertiaryBase10,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
