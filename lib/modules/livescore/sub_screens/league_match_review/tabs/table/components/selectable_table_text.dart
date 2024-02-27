import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum SelectionTableTextEnum { overall, home, away }

class SelectableTableText extends StatefulWidget {
  const SelectableTableText({super.key});

  @override
  _SelectableTableTextState createState() => _SelectableTableTextState();
}

class _SelectableTableTextState extends State<SelectableTableText> {
  SelectionTableTextEnum selectedText = SelectionTableTextEnum.overall;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = SelectionTableTextEnum.overall;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.overall
                  ? AppColors.primaryBase6
                  : AppColors.tertiary3,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'OVERALL',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.overall
                    ? AppColors.tertiary1
                    : AppColors.tertiary8,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = SelectionTableTextEnum.home;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.home
                  ? AppColors.primaryBase6
                  : AppColors.tertiary3,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'HOME',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.home
                    ? AppColors.tertiary1
                    : AppColors.tertiary8,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = SelectionTableTextEnum.away;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.away
                  ? AppColors.primaryBase6
                  : AppColors.tertiary3,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'AWAY',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.away
                    ? AppColors.tertiary1
                    : AppColors.tertiary8,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
