import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/colors.dart';

class HideRepliesContainer extends StatelessWidget {
  const HideRepliesContainer({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: const Divider(
              thickness: 1,
              color: AppColors.tertiary3,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              child: Text(
                'Hide replies',
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.tertiary6,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
