import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class Closer extends StatelessWidget {
  const Closer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 32.w,
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.tertiary1.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          'assets/svgs/close.svg',
        ),
      ),
    );
  }
}
