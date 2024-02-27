import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/components/knot.dart';
import 'package:sportboo_mobile_client/components/line.dart';

import '../../../core/theme/colors.dart';
import '../../../unils/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Knot(isWide: true),
            TopBar(title: title),
            const Line(),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.tertiary3,
              ),
              child: SvgPicture.asset(
                getSvg('close'),
                height: 12.h,
                width: 12.w,
                fit: BoxFit.scaleDown,
                color: AppColors.tertiary8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
