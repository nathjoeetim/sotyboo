import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/theme/colors.dart';

class SportbooSnackBar extends StatelessWidget {
  final String message;
  final Function(String id) onView;

  const SportbooSnackBar({super.key, required this.message, required this.onView});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(2, 2, 16, 2),
    decoration: BoxDecoration(
      color: AppColors.primaryBase6,
      borderRadius: BorderRadius.circular(16)
    ),
    child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.tertiary1,
                    borderRadius: BorderRadius.circular(14)),
                child: SvgPicture.asset('assets/svgs/messages.svg',)),
            const Gap(8),
            Expanded(
              child: Text(message, style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary1,
                  fontFamily: 'Inter'),),
            ),
            const Gap(8),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.secondaryBase4,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {onView('');},
                  child: Text('View',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiaryBase10,
                          fontFamily: 'Inter')),
                )),
          ],
        ),
  );
}
