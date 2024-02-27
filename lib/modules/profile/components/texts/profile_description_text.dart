import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class ProfileDescriptionText extends StatelessWidget {
  const ProfileDescriptionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.tertiary8,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
