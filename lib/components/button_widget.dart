import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/colors.dart';
import '../unils/utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text,
    this.color,
    this.outlined = false,
    this.width,
    required this.onTap,
    this.fillColor,
    this.height,
    this.padding,
    this.radius,
    this.style,
    this.child,
    this.isDeactivated = false,
  });

  final String? text;
  final TextStyle? style;
  final Color? color;
  final Color? fillColor;
  final bool outlined;
  final double? width;
  final double? height;
  final double? padding;
  final double? radius;
  final VoidCallback onTap;
  final Widget? child;
  final bool isDeactivated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // !use height instead of padding
        width: width ?? getDeviceWidth(context),
        height: height ?? 48,
        decoration: BoxDecoration(
          color: isDeactivated ? AppColors.tertiary4 : outlined ? fillColor : color ?? AppColors.primaryBase6,
          borderRadius: BorderRadius.circular(radius ?? 16.r),
          border: outlined
              ? Border.all(color: color ?? AppColors.primaryBase6, width: 1.4)
              : null,
        ),
        child: Center(
          child: child ??
              Text(
                text!,
                style: style ?? TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    color: outlined
                        ? color ?? AppColors.primaryBase6
                        : AppColors.tertiary1),
              ),
        ),
      ),
    );
  }
}
