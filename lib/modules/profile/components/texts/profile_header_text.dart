import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class ProfileHeaderText extends StatelessWidget {
  const ProfileHeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.tertiaryBase10,
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
