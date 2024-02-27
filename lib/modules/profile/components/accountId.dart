import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class AccountId extends StatelessWidget {
  const AccountId({
    Key? key,
    this.isBig = false,
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 4.w,
        top: 4.w,
        bottom: 4.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isBig ? 24.r : 16.r),
        color: AppColors.tertiaryTint2,
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account ID:',
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: isBig ? 10.sp : 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: isBig ? 5.h : 4.h),
              Text(
                '344982',
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: isBig ? 13.sp : 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
              radius: isBig ? 14.r : 10.r,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                'assets/svgs/copy.svg',
                height: isBig ? 20.h : 12.h,
                width: isBig ? 20.w : 12.w,
              )),
        ],
      ),
    );
  }
}
