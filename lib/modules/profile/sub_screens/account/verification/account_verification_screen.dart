import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/account_verification_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/upload_front/upload_front_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/widgets/not_verified_widget.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/widgets/verification_pending_widget.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/widgets/verified_widget.dart';

import '../../../../../core/theme/colors.dart';
import '../../../components/custom_app_bar.dart';

class AccountVerificationScreen extends HookWidget {
  const AccountVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<AccountVerificationViewmodel>(context, listen: false)
          .checkVerificationStage();
      return null;
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Account'),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: AppColors.tertiary0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const ProfileHeaderText(
                            text: 'Account Verification'),
                      ),
                      SizedBox(height: 24.h),
                      Consumer<AccountVerificationViewmodel>(
                        builder: (context, model, child) {
                          if (model.verificationStage ==
                              VerificationStage.notVerified) {
                            return const NotVerifiedWidget();
                          } else if (model.verificationStage ==
                              VerificationStage.pending) {
                            return const VerificationPendingWidget();
                          } else {
                            return const VerifiedWidget();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

class NoteBox extends StatelessWidget {
  const NoteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColors.primary2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'Before you can withdraw, we need to verify your identity.\n\nUpload a copy or take a photo of your document by selecting one of the options below.',
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          height: 1.20,
        ),
      ),
    );
  }
}

class VerificationTypeButton extends StatelessWidget {
  const VerificationTypeButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiaryBase10.withOpacity(0.08),
              blurRadius: 16.r,
              offset: Offset(0, 4.w),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
*/
