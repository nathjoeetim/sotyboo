import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/colors.dart';

class TableHeaderText extends StatelessWidget {
  const TableHeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10.sp,
            color: AppColors.tertiary8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TableHeaderTextTwo extends StatelessWidget {
  const TableHeaderTextTwo({
    Key? key,
    required this.text,
    this.isCentered = true,
  }) : super(key: key);

  final String text;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: isCentered
            ? EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w)
            : EdgeInsets.only(top: 8.h, bottom: 8.h, left: 20.w),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10.sp,
            color: AppColors.tertiary8,
          ),
        ),
      ),
    );
  }
}
