import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class BottomSheetDescriptionText extends StatelessWidget {
  const BottomSheetDescriptionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.tertiary8,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        height: 1.20,
      ),
    );
  }
}
