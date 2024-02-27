import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

TextStyle textStyle(val, index) => TextStyle(
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
  color: index == val ? AppColors.primaryBase6 : AppColors.tertiary8,
);