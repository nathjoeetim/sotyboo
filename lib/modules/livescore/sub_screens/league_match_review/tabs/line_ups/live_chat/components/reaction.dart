import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

enum ReactionType {
  flame,
  heart,
  happy,
  hospitable,
  blushSmile,
}

class Reaction extends StatelessWidget {
  const Reaction({
    Key? key,
    required this.reactionType,
    required this.numbers,
    required this.onPressed,
  }) : super(key: key);

  final ReactionType reactionType;
  final int numbers;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    late Widget emoji;

    switch (reactionType) {
      case ReactionType.flame:
        emoji = Image.asset(
          'assets/images/flame.png',
          //height: 16.h,
          //width: 16.h,
        );
        break;
      case ReactionType.heart:
        emoji = SvgPicture.asset(
          'assets/svgs/heart.svg',
          color: AppColors.dangerBase3,
        );
        break;
      case ReactionType.happy:
        emoji = SvgPicture.asset('assets/svgs/happy.svg');
        break;
      case ReactionType.hospitable:
        emoji = SvgPicture.asset('assets/svgs/hospitable.svg');
        break;
      case ReactionType.blushSmile:
        emoji = Image.asset(
          'assets/images/blush-smile.png',
          //height: 16.h,
          //width: 16.h,
        );
        break;
      default:
    }

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
            SizedBox(
              height: 16.h,
              width: 16.w,
              child: emoji,
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
