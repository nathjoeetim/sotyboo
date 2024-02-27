import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

enum ResultType { win, draw, loss }

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.resultType,
  }) : super(key: key);

  final ResultType resultType;

  @override
  Widget build(BuildContext context) {
    late String text;
    late Color color;

    if (resultType == ResultType.win) {
      text = 'W';
      color = AppColors.success2;
    } else if (resultType == ResultType.draw) {
      text = 'D';
      color = AppColors.warning2;
    } else {
      text = 'L';
      color = AppColors.danger2;
    }

    return CircleAvatar(
      backgroundColor: color,
      radius: 12,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.tertiary11,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
