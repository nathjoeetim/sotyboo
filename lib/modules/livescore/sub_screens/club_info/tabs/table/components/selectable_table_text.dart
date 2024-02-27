import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum SelectionTableTextEnum { all, home, away }

class SelectableTableText extends StatefulWidget {
  const SelectableTableText({super.key});

  @override
  _SelectableTableTextState createState() => _SelectableTableTextState();
}

class _SelectableTableTextState extends State<SelectableTableText> {
  SelectionTableTextEnum selectedText = SelectionTableTextEnum.all;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = SelectionTableTextEnum.all;
            });
          },
          child: Container(
            // height: ,
            decoration: BoxDecoration(
              boxShadow: [
                selectedText == SelectionTableTextEnum.all
                    ? BoxShadow(
                        color: AppColors.tertiaryBase10.withOpacity(0.08),
                        blurRadius: 8.r,
                        offset: Offset(
                            0, 2.h), // changes the position of the shadow
                      )
                    : const BoxShadow(color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.all
                  ? AppColors.tertiary1
                  : AppColors.tertiary2,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'ALL',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.all
                    ? AppColors.primaryBase6
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
              boxShadow: [
                selectedText == SelectionTableTextEnum.home
                    ? BoxShadow(
                        color: AppColors.tertiaryBase10.withOpacity(0.08),
                        blurRadius: 8.r,
                        offset: Offset(
                            0, 2.h), // changes the position of the shadow
                      )
                    : const BoxShadow(color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.home
                  ? AppColors.tertiary1
                  : AppColors.tertiary2,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'HOME',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.home
                    ? AppColors.primaryBase6
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
              boxShadow: [
                selectedText == SelectionTableTextEnum.away
                    ? BoxShadow(
                        color: AppColors.tertiaryBase10.withOpacity(0.08),
                        blurRadius: 8.r,
                        offset: Offset(
                            0, 2.h), // changes the position of the shadow
                      )
                    : const BoxShadow(color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(24.r),
              color: selectedText == SelectionTableTextEnum.away
                  ? AppColors.tertiary1
                  : AppColors.tertiary2,
            ),
            padding: EdgeInsets.all(8.h),
            child: Text(
              'AWAY',
              style: TextStyle(
                color: selectedText == SelectionTableTextEnum.away
                    ? AppColors.primaryBase6
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
