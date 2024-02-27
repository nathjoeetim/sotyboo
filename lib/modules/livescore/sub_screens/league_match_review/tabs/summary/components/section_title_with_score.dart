import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class SectionTitleWithScore extends StatelessWidget {
  const SectionTitleWithScore({
    Key? key,
    required this.title,
    required this.firstTeamScore,
    required this.secondTeamScore,
  }) : super(key: key);

  final String title;
  final String firstTeamScore;
  final String secondTeamScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
        ),
        Text(
          '$firstTeamScore:$secondTeamScore',
          style: TextStyle(
            color: AppColors.tertiaryBase10,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
