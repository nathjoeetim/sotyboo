import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/theme/colors.dart';

enum CommentaryType {
  plain,
  whistle,
  goal,
  time,
  foul,
  corner,
  info,
  yellowCard,
  redCard,
  substitution,
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    required this.commentType,
    required this.time,
    required this.message,
    required this.image,
  }) : super(key: key);

  final CommentaryType commentType;
  final String time;
  final String message;
  final String image;

  @override
  Widget build(BuildContext context) {
    late Widget icon;
    late Color messageColor;
    late FontWeight fontWeight;

    if (commentType == CommentaryType.whistle) {
      icon = Image.asset(
        'assets/images/whistle.png',
        color: AppColors.tertiaryBase10,
      );
      messageColor = AppColors.tertiary9;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.goal) {
      icon = SvgPicture.asset('assets/svgs/ball-plain.svg');
      messageColor = AppColors.dangerBase3;
      fontWeight = FontWeight.w500;
    } else if (commentType == CommentaryType.time) {
      icon = SvgPicture.asset('assets/svgs/timer.svg');
      messageColor = AppColors.tertiary9;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.foul) {
      icon = SvgPicture.asset('assets/svgs/warning.svg');
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w500;
    } else if (commentType == CommentaryType.corner) {
      icon = SvgPicture.asset('assets/svgs/flag.svg');
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.info) {
      icon = SvgPicture.asset('assets/svgs/info.svg');
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.yellowCard) {
      icon = SvgPicture.asset(
        'assets/svgs/booking.svg',
        fit: BoxFit.fitHeight,
      );
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.redCard) {
      icon = SvgPicture.asset(
        'assets/svgs/booking.svg',
        fit: BoxFit.fitHeight,
        color: AppColors.dangerBase3,
      );
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    } else if (commentType == CommentaryType.substitution) {
      icon = SvgPicture.asset('assets/svgs/substitution-plain.svg');
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    } else {
      messageColor = AppColors.tertiaryBase10;
      fontWeight = FontWeight.w400;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Time
            Container(
              height: 32.h,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.tertiary2,
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.tertiary3,
                  )),
              alignment: Alignment.center,
              child: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: AppColors.tertiaryBase10,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            // Icon
            commentType != CommentaryType.plain
                ? Container(
                    height: 32.h,
                    padding: EdgeInsets.all(4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.tertiary2,
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.tertiary3,
                        )),
                    child: SizedBox(
                      height: 24.h,
                      child: icon,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          message,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: 13.sp,
            color: messageColor,
          ),
        ),
        image != ''
            ? Container(
                margin: EdgeInsets.only(top: 8.h),
                height: 160.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset(
                  'assets/images/$image.png',
                  fit: BoxFit.fill,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
