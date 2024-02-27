import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/drop_down_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/time_out/viewmodel/timeout_viemmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../unils/validators.dart';

class TimeOutTab extends StatelessWidget {
  const TimeOutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: SingleChildScrollView(
        child: Form(
          key: Provider.of<TimeoutViewmodel>(context, listen: false).formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                const TopBar(),
                SizedBox(height: 24.h),
                const ProfileHeaderText(text: 'Time-Out Period'),
                SizedBox(height: 8.h),
                const ProfileDescriptionText(
                    text: 'You can take some break playing. '),
                SizedBox(height: 24.h),
                const TimeoutBox(),
                SizedBox(height: 16.h),
                const PasswordBox(),
                SizedBox(height: 16.h),
                const NoteBox(),
                SizedBox(height: 16.h),
                const UpdateButton(),
                SizedBox(height: 16.h),
                const CancelButton(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2.h,
        bottom: 2.h,
        left: 2.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryTint10,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                getImage('timeout'),
                fit: BoxFit.scaleDown,
                height: 78.h,
                width: 91.27.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Existing Time-Out',
                    style: TextStyle(
                      color: AppColors.tertiary4,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'You have set 24 hours Time-Out Period',
                    style: TextStyle(
                      color: AppColors.tertiary1,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.success2,
              ),
              child: Text(
                '24:00:00',
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeoutBox extends HookWidget {
  const TimeoutBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<TimeoutViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: textController,
          labelText: 'Time-Out period',
          hintText: '',
          items: model.timeoutPeriodItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            textController.text = selectedItem;
            model.timeoutPeriod = selectedItem;
          },
        );
      },
    );
  }
}

class PasswordBox extends HookWidget {
  const PasswordBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<TimeoutViewmodel>(
      builder: (context, model, child) {
        return PasswordTextField(
          textController: textController,
          labelText: 'Password',
          hintText: 'Enter Password',
          isObscure: model.isPasswordObscure,
          onObscurePressedCallback: model.togglePasswordObscure,
          textInputAction: TextInputAction.done,
          validatorCallback: Validators.validatePassword(
            isValidated: (value) {
              model.isPasswordValidated = value;
            },
            // function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.password = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class NoteBox extends StatelessWidget {
  const NoteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      color: AppColors.primary2,
      child: Text(
        'You won’t be able to play within your time-out period.',
        style: TextStyle(
          color: AppColors.tertiary8,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 1.20,
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeoutViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Update',
          onPressed: () {
            if (model.formKey.currentState!.validate()) {
              log('Updating...');
            } else {
              log('Not Validated');
            }
          },
        );

        /* return InkWell(
            onTap: model.isCompleted
                ? () {
              log('HOME PAGE');

              SignInModel signInBody = SignInModel(
                email: model.email.toLowerCase().trim(),
                password: model.password.trim(),
              );

              final authViewmodel =
              Provider.of<AuthViewModel>(context, listen: false);

              //Login the user using the email and password
              //value is an object of ResponseModel that is returned during login
              authViewmodel
                  .login(
                signInModel: signInBody,
                rememberMe: model.isRememberMeCheck,
              )
                  .then((value) {
                if (value.isSuccess) {
                  UserCredentials data = value.data;

                  log('USER TYPE ------  ${data.userType}');

                  if (data.userType == AppConstants.CLIENT) {
                    // If the client is already Verified
                    if (data.isVerified!) {
                      Provider.of<ClientViewmodel>(context,
                          listen: false)
                          .getClientInfo()
                          .then(
                            (value) {
                          showCustomSnackBar(
                            context,
                            message: value.message!,
                            title: 'Perfect',
                            isError: !value.isSuccess,
                          );

                          return Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                                (route) => false,
                          );
                        },
                      );
                    } else {
                      // If the Client is not verified

                      showCustomSnackBar(
                        context,
                        message: 'Verify your Email!',
                        title: 'Email Verification',
                        isError: true,
                      );

                      Navigator.pushNamed(
                        context,
                        VerifyEmailScreen.routeName,
                        arguments: {
                          'email': model.email.toLowerCase().trim(),
                          'fromSignInPage':
                          true, // or provide the appropriate value
                        },
                      );

                      */ /*  Navigator.pushNamed(
                            context,
                            VerifyEmailScreen.routeName,
                            arguments: model.email.toLowerCase().trim(),
                          );*/ /*
                    }
                  } else if (data.userType == AppConstants.PHARMACIST) {
                    Provider.of<PharmViewmodel>(context, listen: false)
                        .getPharmInfo()
                        .then(
                          (value) {
                        showCustomSnackBar(
                          context,
                          message: value.message!,
                          title: 'Perfect',
                          isError: !value.isSuccess,
                        );

                        return Navigator.pushNamedAndRemoveUntil(
                          context,
                          PharmHomeScreen.routeName,
                              (route) => false,
                        );
                      },
                    );
                  }

                  log('Successful Login');
                } else {
                  log('Unsuccessful Login');
                  showCustomSnackBar(context, message: value.message!);
                }
              });
            }
                : null,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 21.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: model.isCompleted
                    ? AppColors.secondaryBlue
                    : AppColors.fillAsh,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          );*/
      },
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeoutViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButtonOutlined(
          text: 'Cancel',
          onPressed: () {},
        );
      },
    );
  }
}
