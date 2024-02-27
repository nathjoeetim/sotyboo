import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/theme/colors.dart';

class MatchInfoCard extends StatelessWidget {
  const MatchInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.h,
          color: AppColors.tertiary3,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detailRow(
                icon: SvgPicture.asset(
                  'assets/svgs/clock.svg',
                  color: AppColors.primaryBase6,
                ),
                text: 'Start at 15:30',
              ),
              _detailRow(
                icon: SvgPicture.asset(
                  'assets/svgs/calendar.svg',
                  color: AppColors.primaryBase6,
                ),
                text: '30 Sep, 2022',
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detailRow(
                icon: Image.asset(
                  'assets/images/whistle.png',
                  color: AppColors.primaryBase6,
                ),
                text: 'Tobias Stieler',
                padWidth: false,
              ),
              _detailRow(
                icon: SvgPicture.asset(
                  'assets/svgs/stadium.svg',
                  color: AppColors.primaryBase6,
                ),
                text: 'Old Stanford',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailRow({
    required Widget icon,
    required String text,
    bool padWidth = true,
  }) =>
      Expanded(
        child: Row(
          children: [
            Container(
              height: 32.h,
              padding: padWidth
                  ? EdgeInsets.symmetric(horizontal: 4.w)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.tertiary3,
              ),
              child: icon,
            ),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.tertiaryBase10,
              ),
            ),
          ],
        ),
      );
}
