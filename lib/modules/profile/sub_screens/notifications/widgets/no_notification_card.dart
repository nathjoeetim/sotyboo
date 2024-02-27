import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class NoNotificationCard extends StatelessWidget {
  const NoNotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        right: 16.w,
        left: 16.w,
      ),
      child: AppCard(
        paddingType: PaddingType.big,
        isGreenBottomBorder: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              getSvg('no-notify'),
              height: 193.h,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'No Notifications',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.tertiaryBase10,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'You currently have no new notifications for now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
