import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/theme/colors.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget(this.heading, {super.key, this.subheading});

  final String heading;
  final String? subheading;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      SvgPicture.asset('assets/svgs/login_icon.svg', height: 56, width: 56,),
      Gap(32.h),
      Text(
        heading,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 31, color: AppColors.tertiaryBase10
        ),
      ),
      if (subheading != null) ...[
        Gap(8.h),
        Text(
          subheading!,
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 16, color: AppColors.tertiary8
          ), textAlign: TextAlign.center,
        ),
      ]
    ]);
  }
}
