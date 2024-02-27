import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class NoMessageCard extends StatelessWidget {
  const NoMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(
          top: 42.h,
          right: 16.w,
          left: 16.w,
        ),
        child: AppCard(
          paddingType: PaddingType.big,
          isGreenBottomBorder: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                getSvg('no-inbox'),
                height: 193.h,
              ),
              SizedBox(height: 24.h),
              Text(
                'Empty Inbox',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.tertiaryBase10,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'You currently have no messages in your inbox',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
              SizedBox(height: 24.h),
              InkWell(
                onTap: () {
                  Provider.of<MessagingTabViewmodel>(context, listen: false)
                      .currentPosition = 0;
                },
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      width: 1.h,
                      color: AppColors.primaryBase6,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        getSvg('add'),
                        height: MediaQuery.of(context).textScaleFactor * 16.h,
                        width: MediaQuery.of(context).textScaleFactor * 16.w,
                        color: AppColors.primaryBase6,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'New Message',
                        style: TextStyle(
                          color: AppColors.primaryBase6,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
