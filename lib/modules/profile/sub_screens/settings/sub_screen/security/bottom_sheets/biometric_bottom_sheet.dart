import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/bottom_sheet_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_bottom_sheet.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

onBiometricPressed({
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
      initialChildSize: 0.475,
      //minChildSize: 1,
      maxChildSize: 0.475,
      builder: (context, scrollController) => const BiometricBottomSheet(),
    ),
  );
}

class BiometricBottomSheet extends StatelessWidget {
  const BiometricBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityViewmodel>(builder: (context, model, child) {
      return CustomBottomSheet(
        title: !model.biometricToggle
            ? 'Enable Biometrics?'
            : 'Disable Biometrics?',
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: _widget(
              context: context,
              isEnabled: model.biometricToggle,
            ),
          ),
        ),
      );
    });
  }

  Widget _widget({
    required BuildContext context,
    required bool isEnabled,
  }) {
    if (!isEnabled) {
      return Column(
        children: [
          SizedBox(height: 24.h),
          const BottomSheetDescriptionText(
            text:
                'Use your biometrics for faster, easier access to your account. Confirm it’s you to continue',
          ),
          SizedBox(height: 16.h),
          _fingerprint(),
          const BottomSheetDescriptionText(
              text: 'Touch the fingerprint sensor'),
          SizedBox(height: 16.h),
          WideButtonOutlined(
              text: 'Cancel',
              onPressed: () {
                log('Cancelling');
              }),
          SizedBox(height: 24.h),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 24.h),
          _fingerprint(),
          const BottomSheetDescriptionText(
              text: 'Are you sure you want to disable biometric login?'),
          SizedBox(height: 16.h),
          WideButton(
              text: 'Disable Biometrics',
              onPressed: () {
                log('Biometric Disabled');
              }),
          SizedBox(height: 16.h),
          WideButtonOutlined(
              text: 'Cancel',
              onPressed: () {
                log('Cancelling');
              }),
          SizedBox(height: 24.h),
        ],
      );
    }
  }

  Widget _fingerprint() => Image.asset(
        getImage('fingerprint'),
        height: 80.h,
        width: 80.w,
      );
}
