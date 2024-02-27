import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '200+ new message since 11:49 PM',
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {
              log('Close');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SvgPicture.asset(
                'assets/svgs/close.svg',
                color: AppColors.tertiaryBase10,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
