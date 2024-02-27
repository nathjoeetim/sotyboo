import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class Odd extends StatelessWidget {
  const Odd({Key? key, required this.data}) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            data['isDown']
                ? 'assets/svgs/arrow-down-red.svg'
                : 'assets/svgs/arrow-up.svg',
            height: 13.h,
            width: 13.h,
          ),
          SizedBox(width: 2.w),
          Text(
            '${data['value']}',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.tertiary9,
            ),
          ),
        ],
      ),
    );
  }
}

class OddTwo extends StatelessWidget {
  const OddTwo({Key? key, required this.data}) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          data['arrow'] == 'down'
              ? SvgPicture.asset(
                  'assets/svgs/arrow-down-red.svg',
                  height: 13.h,
                  width: 13.h,
                )
              : data['arrow'] == 'up'
                  ? SvgPicture.asset(
                      'assets/svgs/arrow-up.svg',
                      height: 13.h,
                      width: 13.h,
                    )
                  : const SizedBox.shrink(),
          SizedBox(width: 2.w),
          Text(
            '${data['value']}',
            style: TextStyle(
                decoration: data['isOut']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 13.sp,
                color: AppColors.tertiary9,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
