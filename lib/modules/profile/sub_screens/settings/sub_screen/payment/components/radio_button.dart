import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return CircleAvatar(
        radius: 12.r,
        backgroundColor: AppColors.primaryBase6,
        child: CircleAvatar(
          radius: 4.r,
          backgroundColor: AppColors.tertiary1,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 12.r,
        backgroundColor: const Color(0xFFBDBDBD),
        child: CircleAvatar(
          radius: 11.r,
          backgroundColor: AppColors.tertiary1,
        ),
      );
    }
  }
}
