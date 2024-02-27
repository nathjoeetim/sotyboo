import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/avatar.dart';
import '../../../core/theme/colors.dart';

class FavoriteClubChip extends StatelessWidget {
  const FavoriteClubChip({
    super.key,
    required this.club,
    required this.isSelected,
    required this.onPressed,
  });

  final String club;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          right: 8.h,
          top: 8.h,
          bottom: 8.h,
        ),
        padding: EdgeInsets.only(
          left: 4.h,
          top: 4.h,
          bottom: 4.h,
          right: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isSelected ? AppColors.primary2 : AppColors.tertiary3,
          border: Border.all(
            color: isSelected ? AppColors.primaryBase6 : AppColors.tertiary4,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(
              radius: 12.r,
              thickBorderColor:
                  isSelected ? AppColors.primary7 : AppColors.tertiary8,
            ),
            SizedBox(width: 8.w),
            Text(
              club,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary7 : AppColors.tertiary8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditFavouriteChip extends StatelessWidget {
  const EditFavouriteChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        //right: 8.h,
        left: 8.h,
        top: 8.h,
        bottom: 8.h,
      ),
      padding: EdgeInsets.only(
        left: 4.h,
        top: 4.h,
        bottom: 4.h,
        right: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.tertiary3,
        border: Border.all(
          color: AppColors.tertiary4,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12.r,
            child: SvgPicture.asset('assets/svgs/edit.svg'),
          ),
          SizedBox(width: 8.w),
          Text(
            'Edit',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.tertiary8,
            ),
          ),
        ],
      ),
    );
  }
}
