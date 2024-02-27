import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class DottedButton extends StatelessWidget {
  const DottedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          color: AppColors.primary2,
        ),
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1.h,
          color: AppColors.primaryBase6,
          radius: Radius.circular(16.r),
          dashPattern: [4.h, 4.h],
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    getSvg('add'),
                    height: 24.h,
                    width: 24.w,
                    color: AppColors.primaryBase6,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    text,
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: AppColors.primaryBase6,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
