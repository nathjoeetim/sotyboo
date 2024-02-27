import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/colors.dart';

class DayContainer extends StatelessWidget {
  const DayContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.tertiary3,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.h,
                color: AppColors.tertiary3,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          child: Text(
            'Today',
            style: TextStyle(
              color: AppColors.tertiary6,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.tertiary3,
          ),
        ),
      ],
    );
  }
}
