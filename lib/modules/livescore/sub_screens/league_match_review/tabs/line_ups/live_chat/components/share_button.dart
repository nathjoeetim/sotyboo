import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    this.showLabel = false,
    required this.onPressed,
  }) : super(key: key);

  final bool showLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/send.svg',
            height: 24.h,
            width: 24.w,
          ),
          if (showLabel)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8.w),
                Text(
                  'Share',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors.tertiary6,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
