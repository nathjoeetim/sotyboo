import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.numbers,
    required this.onPressed,
  }) : super(key: key);

  final int numbers;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        padding: EdgeInsets.only(
          top: 2.h,
          left: 2.w,
          right: 4.w,
          bottom: 2.h,
        ),
        decoration: ShapeDecoration(
          color: AppColors.tertiary3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svgs/message.svg',
              height: 16.h,
              width: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                numbers.toString(),
                style: TextStyle(
                  color: AppColors.tertiary6,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
