import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/bottom_sheet_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_bottom_sheet.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

onDisableAccountPressed({
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
      initialChildSize: 0.55,
      //minChildSize: 1,
      maxChildSize: 0.55,
      builder: (context, scrollController) => const DisableAccountBottomSheet(),
    ),
  );
}

class DisableAccountBottomSheet extends HookWidget {
  const DisableAccountBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();

    return CustomBottomSheet(
      title: 'Disable Account?',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              SvgPicture.asset(
                getSvg('trash'),
                height: 80.h,
                width: 79.19.w,
              ),
              SizedBox(height: 16.h),
              const BottomSheetDescriptionText(
                text:
                    'You are about to disable your account. Please note that you’ll no longer have access to SiuuuSport Account.',
              ),
              SizedBox(height: 16.h),
              PasswordTextField(
                textController: passwordController,
                labelText: 'Password',
                hintText: 'Enter Password',
                isObscure: true,
                onObscurePressedCallback: () {},
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 16.h),
              WideButton(
                text: 'Disable Account',
                isRed: true,
                onPressed: () {
                  log('SMS 2FA');
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
