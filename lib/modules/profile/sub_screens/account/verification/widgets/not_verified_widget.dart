import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/account_verification_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/upload_front/upload_front_screen.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../../../unils/navigation.dart';

class NotVerifiedWidget extends StatelessWidget {
  const NotVerifiedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const NoteBox(),
          SizedBox(height: 24.h),
          VerificationTypeButton(
            text: 'Drivers License',
            onPressed: () {
              log('Drivers License');
              Provider.of<AccountVerificationViewmodel>(context, listen: false)
                  .initialize(docType: DocType.driversLicense);
              PageRouter.gotoWidget(
                context,
                const UploadFrontScreen(),
              );
            },
          ),
          SizedBox(height: 8.h),
          VerificationTypeButton(
            text: 'ID Card',
            onPressed: () {
              log('ID Card');
              Provider.of<AccountVerificationViewmodel>(context, listen: false)
                  .initialize(docType: DocType.idCard);
              PageRouter.gotoWidget(
                context,
                const UploadFrontScreen(),
              );
            },
          ),
          SizedBox(height: 8.h),
          VerificationTypeButton(
            text: 'Passport',
            onPressed: () {
              log('Passport');
              Provider.of<AccountVerificationViewmodel>(context, listen: false)
                  .initialize(docType: DocType.passport);
              PageRouter.gotoWidget(
                context,
                const UploadFrontScreen(),
              );
            },
          ),
          SizedBox(height: 8.h),
          VerificationTypeButton(
            text: 'Residency Permit or Visa',
            onPressed: () {
              log('Residency Permit or Visa');
              Provider.of<AccountVerificationViewmodel>(context, listen: false)
                  .initialize(docType: DocType.permit);
              PageRouter.gotoWidget(
                context,
                const UploadFrontScreen(),
              );
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

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
