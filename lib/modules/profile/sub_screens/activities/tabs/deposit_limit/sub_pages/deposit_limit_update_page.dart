import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_description_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/viewmodel/deposit_limit_viewmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

import '../../../../../../../unils/validators.dart';

class DepositLimitUpdatePage extends StatelessWidget {
  const DepositLimitUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Form(
        key: Provider.of<DepositLimitViewmodel>(context, listen: false).formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              const ProfileHeaderText(text: 'Deposit Limit'),
              SizedBox(height: 8.h),
              const ProfileDescriptionText(
                  text: 'Your existing deposit limits are:'),
              SizedBox(height: 24.h),
              const FilledBox(text: '24 Hours Limit'),
              SizedBox(height: 16.h),
              const DayLimitBox(),
              SizedBox(height: 16.h),
              const FilledBox(text: '7 Days Limit'),
              SizedBox(height: 16.h),
              const WeekLimitBox(),
              SizedBox(height: 16.h),
              const FilledBox(text: '30 Days Limit'),
              SizedBox(height: 16.h),
              const MonthLimitBox(),
              SizedBox(height: 16.h),
              const PasswordBox(),
              SizedBox(height: 16.h),
              const UpdateButton(),
              SizedBox(height: 16.h),
              const CancelButton(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class FilledBox extends StatelessWidget {
  const FilledBox({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: const BoxDecoration(
        color: AppColors.tertiary3,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.tertiary8,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class DayLimitBox extends HookWidget {
  const DayLimitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<DepositLimitViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Set Limit',
          hintText: 'Enter Limit',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          /*  validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            model.dayLimit = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class WeekLimitBox extends HookWidget {
  const WeekLimitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<DepositLimitViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Set Limit',
          hintText: 'Enter Limit',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          /*  validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            model.weekLimit = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class MonthLimitBox extends HookWidget {
  const MonthLimitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<DepositLimitViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Set Limit',
          hintText: 'Enter Limit',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          /*  validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            model.monthLimit = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
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

    return Consumer<DepositLimitViewmodel>(
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

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositLimitViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Update',
          onPressed: () {
            if (model.formKey.currentState!.validate()) {
              log('Updating...');
              model.toMainPage();
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
    return Consumer<DepositLimitViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButtonOutlined(
          text: 'Cancel',
          onPressed: () {},
        );
      },
    );
  }
}
