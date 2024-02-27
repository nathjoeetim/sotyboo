import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/bottom_sheet_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_bottom_sheet.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

// logo-icon-main
// trash
// security-icon
// fingerprint
onTwoFaPressed({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        topRight: Radius.circular(32.r),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.53,
      //minChildSize: 1,
      maxChildSize: 0.53,
      builder: (context, scrollController) => const twoFaBottomSheet(),
    ),
  );
}

class twoFaBottomSheet extends StatelessWidget {
  const twoFaBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: '2-Step Verification',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              SvgPicture.asset(
                getSvg('security-icon'),
                height: 53.6.h,
                width: 60.64.w,
              ),
              SizedBox(height: 16.h),
              const BottomSheetDescriptionText(
                text:
                    'Protect your account form unauthorized access by enabling 2 Step Verification.\nTab enable to use your Phone Number or Google Authenticator',
              ),
              SizedBox(height: 16.h),
              WideButton(
                  text: 'Enable SMS 2FA',
                  onPressed: () {
                    log('SMS 2FA');
                  }),
              SizedBox(height: 16.h),
              WideButtonOutlined(
                  text: 'Enable Other 2FA Method',
                  onPressed: () {
                    log('Other 2FA');
                  }),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
