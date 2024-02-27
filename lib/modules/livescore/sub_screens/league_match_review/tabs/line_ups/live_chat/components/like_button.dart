import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key? key,
    required this.isLiked,
    this.showLabel = false,
    required this.onPressed,
  }) : super(key: key);

  final bool isLiked;
  final bool showLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isLiked ? 'assets/svgs/liked.svg' : 'assets/svgs/like.svg',
            height: 24.h,
            width: 24.w,
          ),
          if (showLabel)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8.w),
                Text(
                  'Like',
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
