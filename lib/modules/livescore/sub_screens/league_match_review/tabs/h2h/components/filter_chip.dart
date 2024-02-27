import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({
    super.key,
    required this.text,
    required this.isActive,
  });

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.h),
      padding: EdgeInsets.only(
        left: 4.h,
        top: 4.h,
        bottom: 4.h,
        right: 8.h,
      ),
      decoration: BoxDecoration(
          color: isActive ? AppColors.primary2 : AppColors.tertiary3,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1.h,
            color: isActive ? AppColors.primaryBase6 : AppColors.tertiary4,
          )),
      child: Row(children: [
        _avatar(),
        SizedBox(
          width: 4.w,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.tertiary8,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),
        ),
      ]),
    );
  }

  CircleAvatar _avatar() => CircleAvatar(
        backgroundColor:
            isActive ? AppColors.primaryBase6 : AppColors.tertiary8,
        radius: 12.r,
        child: CircleAvatar(
          radius: 11.r,
          backgroundColor: AppColors.tertiaryTint4,
        ),
      );
}
