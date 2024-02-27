import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class Booking extends StatelessWidget {
  const Booking({
    Key? key,
    required this.cardType,
  }) : super(key: key);

  final String cardType;

  @override
  Widget build(BuildContext context) {
    if (cardType == 'yellow') {
      return SvgPicture.asset(
        'assets/svgs/booking.svg',
      );
    } else if (cardType == 'red') {
      return SvgPicture.asset(
        'assets/svgs/booking.svg',
        color: AppColors.dangerBase3,
      );
    } else if (cardType == 'yellow-red') {
      return Stack(
        children: [
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              'assets/svgs/booking.svg',
            ),
          ),
          Positioned(
            right: 0,
            left: 2.w,
            child: SvgPicture.asset(
              'assets/svgs/booking.svg',
              color: AppColors.dangerBase3,
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
