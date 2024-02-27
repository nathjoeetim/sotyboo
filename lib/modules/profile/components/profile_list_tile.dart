import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.title,
    this.bigPadding = false,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool bigPadding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: bigPadding ? 24.h : 16.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(
              'assets/svgs/arrow-right.svg',
              height: 20.h,
              width: 20.w,
              color: AppColors.tertiaryBase10,
            ),
          ],
        ),
      ),
    );
  }
}
