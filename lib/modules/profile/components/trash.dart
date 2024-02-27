import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';
import '../../../unils/utils.dart';

class Trash extends StatelessWidget {
  const Trash({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Delete Message
        onPressed.call();
        Navigator.pop(context);
      },
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.h,
            color: AppColors.tertiary3,
          ),
        ),
        child: SvgPicture.asset(
          getSvg('trash-2'),
          height: 24.h,
          width: 24.w,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
