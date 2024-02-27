import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/viewmodel/deposit_limit_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class DepositLimitMainPage extends StatelessWidget {
  const DepositLimitMainPage({Key? key}) : super(key: key);

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
              getSvg('no-data-image'),
              height: 193.h,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'No Data Available',
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
                'Set your deposit limit to help you facilitate the amount of deposit you make daily, monthly or yearly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            WideButton(
              text: 'Set limit',
              onPressed: () {
                Provider.of<DepositLimitViewmodel>(context, listen: false)
                    .toUpdatePage();
              },
            ),
            /*ElevatedButton(
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
            )*/
          ],
        ),
      ),
    );
  }
}
