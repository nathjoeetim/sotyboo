import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.showArrow = true,
  }) : super(key: key);

  final String title;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
        ),
        Visibility(
          visible: showArrow,
          child: SvgPicture.asset(
            'assets/svgs/arrow-right.svg',
            width: 16.w,
            height: 16.h,
            color: AppColors.tertiary9,
          ),
        ),
      ],
    );
  }
}
