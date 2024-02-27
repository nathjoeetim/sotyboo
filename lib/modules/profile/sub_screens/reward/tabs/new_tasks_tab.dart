import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/viewmodel/rewards_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class NewTasksTab extends StatelessWidget {
  const NewTasksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.h,
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
              'assets/svgs/task.svg',
              height: 193.h,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'No New Task Available',
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
                'Your new task will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Provider.of<RewardsTabViewmodel>(context, listen: false)
                    .currentPosition = 1;
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                backgroundColor: AppColors.primaryTint9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                'Existing tasks',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiary1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
