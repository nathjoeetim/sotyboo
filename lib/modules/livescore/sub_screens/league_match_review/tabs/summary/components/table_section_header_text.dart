import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class TableSectionHeaderText extends StatelessWidget {
  const TableSectionHeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: AppColors.tertiary8,
          ),
        ),
      ),
    );
  }
}
