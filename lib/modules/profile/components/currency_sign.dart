import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../unils/utils.dart';

class CurrencySign extends StatelessWidget {
  const CurrencySign({
    Key? key,
    this.size = 12,
    this.color,
  }) : super(key: key);

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // Get the current text scaling factor
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // Calculate the scaled image size
    double imageSize = size * textScaleFactor;

    return Image.asset(
      getImage('naira-icon'),
      width: imageSize.w,
      height: imageSize.h,
      color: color ?? AppColors.tertiaryBase10,
    );
  }
}
