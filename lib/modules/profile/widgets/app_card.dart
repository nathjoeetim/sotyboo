import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

enum PaddingType { small, big }

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    this.paddingType = PaddingType.small,
    this.isGreenBottomBorder = false,
    required this.child,
  }) : super(key: key);

  final PaddingType paddingType;
  final bool isGreenBottomBorder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    late double padding;

    if (paddingType == PaddingType.small) {
      padding = 16.h;
    } else {
      padding = 24.h;
    }

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
            color: AppColors.tertiaryBase10.withOpacity(0.08),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: isGreenBottomBorder
            ? BoxDecoration(
                color: AppColors.tertiary1,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryTint7,
                    blurRadius: 0,
                    offset: Offset(0, 2.h),
                  ),
                ],
              )
            : null,
        child: child,
      ),
    );
  }
}
