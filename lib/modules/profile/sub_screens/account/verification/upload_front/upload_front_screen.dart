import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/account_verification_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/upload_back/upload_back_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/share_app/invite_friends_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/widgets/upload_bottom_sheet.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../../../unils/navigation.dart';
import '../../../../../../unils/utils.dart';
import '../../../../components/custom_app_bar.dart';

class UploadFrontScreen extends HookWidget {
  const UploadFrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Account',
                trailing: Text(
                  'Step 1 of 2',
                  style: TextStyle(
                    color: AppColors.primaryBase6,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                color: AppColors.tertiary0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      const ProfileHeaderText(text: 'Account Verification'),
                      SizedBox(height: 24.h),
                      const UploadText(),
                      const UploadImageNoteBox(),
                      const DocumentImage(),
                      const CheckPhotoNoteBox(),
                      SizedBox(height: 24.h),
                      const FullButton(),
                      SizedBox(height: 16.h),
                      const OutlinedButton(),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadText extends StatelessWidget {
  const UploadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      return Text(
        'Upload front of ${model.docType.value}',
        style: TextStyle(
          color: AppColors.tertiary8,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      );
    });
  }
}

class UploadImageNoteBox extends StatelessWidget {
  const UploadImageNoteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      return model.uploadStage == UploadStage.choose
          ? Container(
              margin: EdgeInsets.only(top: 24.h),
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: AppColors.primary2,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Upload a colour image of the entire document. Screenshots are not allowed. JPG, JPEG or PNG format only.',
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }
}

class DocumentImage extends StatelessWidget {
  const DocumentImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      return Center(
        child: Container(
          width: 300.w,
          height: 190.h,
          margin: EdgeInsets.only(top: 24.h),
          child: model.uploadStage != UploadStage.choose
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.file(
                    model.frontDocument!,
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    //color: Colors.yellow,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.tertiaryBase10.withOpacity(0.08),
                        blurRadius: 16.r,
                        offset: Offset(0, 4.h),
                        spreadRadius: 0,
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                        getImage('passport-front'),
                      ),
                      fit: BoxFit.none,
                      scale: 1.9,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}

class CheckPhotoNoteBox extends StatelessWidget {
  const CheckPhotoNoteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      return model.uploadStage != UploadStage.choose
          ? Container(
              margin: EdgeInsets.only(top: 24.h),
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: AppColors.primary2,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check Photo',
                    style: TextStyle(
                      color: AppColors.tertiaryBase10,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        _dotNumberedText(
                          'The image is not a valid form of identification',
                        ),
                        _dotNumberedText(
                          'Use a valid government-issued document',
                        ),
                        _dotNumberedText(
                          'Please note that International Driving Permits are not accepted.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink();
    });
  }

  Widget _dotNumberedText(String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•', // Dot character
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiaryBase10,
            ),
          ),
          SizedBox(width: 8.w), // Adjust the spacing between the dot and text
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 1.20,
              ),
            ),
          ),
        ],
      );
}

class FullButton extends StatelessWidget {
  const FullButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      String text = '';

      VoidCallback? chooseFile() {
        //return onInviteFriendsPressed(context: context);
        return onUploadPressed(
          context: context,
          onPhotoLibraryPressed: () {
            model.selectImage(selectOption: SelectOption.photoLibrary);
          },
          onCameraPressed: () {
            model.selectImage(selectOption: SelectOption.camera);
          },
          onDocumentsPressed: () {
            model.selectImage(selectOption: SelectOption.documents);
          },
        );
      }

      VoidCallback confirm() {
        return () {
          log('Upload back screen...');
          log('Drivers License');
          model.reset();
          PageRouter.gotoWidget(
            context,
            replacePreviousScreen: true,
            const UploadBackScreen(),
          );
        };
      }

      if (model.uploadStage == UploadStage.choose) {
        text = 'Choose file';
      } else if (model.uploadStage == UploadStage.tryAgain) {
        text = 'Try again';
      } else {
        text = 'Confirm';
      }

      return WideButton(
        text: text,
        onPressed: () {
          if (model.uploadStage != UploadStage.confirm) {
            chooseFile()?.call();

            // If verification failed, move to the tryAgain stage.
            // If successful, move to the Confirm stage
          } else {
            confirm().call();
          }
        },
      );
    });
  }
}

class OutlinedButton extends StatelessWidget {
  const OutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVerificationViewmodel>(
        builder: (context, model, child) {
      VoidCallback? tryAgain() {
        return () {
          log('Try Again');
          model.reset();
        };
      }

      VoidCallback? cancel() {
        return () {
          log('Cancelling');
          Navigator.pop(context);
        };
      }

      return WideButtonOutlined(
        text: model.uploadStage != UploadStage.confirm ? 'Cancel' : 'Try again',
        onPressed: () {
          if (model.uploadStage != UploadStage.confirm) {
            cancel()?.call();
          } else {
            tryAgain()?.call();
          }
        },
      );
    });
  }
}
