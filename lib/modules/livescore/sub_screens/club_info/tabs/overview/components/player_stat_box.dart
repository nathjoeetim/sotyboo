import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';

class PlayerStatBox extends StatelessWidget {
  const PlayerStatBox({
    super.key,
    this.addTitle = true,
    required this.title,
    this.addBorder = false,
  });

  final bool addTitle;
  final String title;
  final bool addBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addTitle
            ? Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13.sp),
                ),
              )
            : const SizedBox.shrink(),
        Container(
          //width: Get.width,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.tertiary1,
            border: addBorder
                ? Border.all(color: AppColors.tertiary3)
                : const Border(),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              ...List.generate(
                5,
                (index) => _playerTile(index),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13.5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBase6,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset('assets/svgs/arrow-down-thin.svg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playerTile(int index) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 12.h,
              left: 20.w,
              right: 16.84,
            ),
            child: Row(
              children: [
                Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.tertiary9,
                  ),
                ),
                SizedBox(width: 12.w),
                const Avatar(
                  radius: 16,
                  avatarType: AvatarType.thin,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Haaland, Erling',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Manchester City',
                        style: TextStyle(
                          color: AppColors.tertiary7,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                SizedBox(width: 20.w),
                //const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '14',
                      style: TextStyle(
                        color: AppColors.tertiaryBase10,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                    const SizedBox(width: 24.83),
                    SvgPicture.asset(
                      'assets/svgs/star.svg',
                      height: 14.33.h,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: AppColors.tertiary3,
          ),
        ],
      );
}
