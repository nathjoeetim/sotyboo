import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/colors.dart';

class GameResponsiblyText extends StatelessWidget {
  const GameResponsiblyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary1,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: Text(
          'Gamble responsibly. 18+',
          style: TextStyle(
            color: AppColors.tertiary8,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
