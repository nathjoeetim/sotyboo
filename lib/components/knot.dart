import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/colors.dart';

class Knot extends StatelessWidget {
  const Knot({Key? key, this.isWide = false}) : super(key: key);

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 13.5.h,
        bottom: 13.5.h,
      ),
      child: Container(
        height: 5.h,
        width: isWide ? 80.w : 48.w,
        decoration: BoxDecoration(
          color: AppColors.tertiary5,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
