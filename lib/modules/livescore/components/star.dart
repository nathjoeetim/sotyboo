import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class Star extends StatelessWidget {
  const Star({
    Key? key,
    this.height,
    required this.isFavourite,
    this.isGreenStar = true,
    required this.onPressed,
  }) : super(key: key);

  final double? height;
  final bool isFavourite;
  final bool isGreenStar;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        isFavourite ? 'assets/svgs/star-broken.svg' : 'assets/svgs/star_empty.svg',
        color: isFavourite
            ? AppColors.primaryBase6
            : isGreenStar
                ? AppColors.primaryBase6
                : AppColors.tertiary9,
        height: height ?? 24.h,
      ),
    );
  }
}
