import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class VerificationStatus extends StatelessWidget {
  const VerificationStatus({
    Key? key,
    this.isBig = false,
    this.isVerified = true,
  }) : super(key: key);

  final bool isBig;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2.h,
        bottom: 2.h,
        left: 2.w,
        right: 8.w,
      ),
      decoration: BoxDecoration(
        color: isVerified ? AppColors.successBase3 : AppColors.secondaryBase4,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: isBig ? 16.r : 12.r,
            backgroundColor:
                isVerified ? AppColors.success2 : AppColors.secondary2,
            child: SvgPicture.asset(
              'assets/svgs/verify.svg',
              height: isBig ? 24.h : 16.h,
              width: isBig ? 24.w : 16.w,
              color: isVerified ? AppColors.success4 : AppColors.tertiaryBase10,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            'Verified',
            style: TextStyle(
              color: isVerified ? AppColors.tertiary1 : AppColors.tertiary11,
              fontSize: isBig ? 13.sp : 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
