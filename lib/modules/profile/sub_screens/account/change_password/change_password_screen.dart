import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/change_password/change_password_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/contact_details/contact_details_viewmodel.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../unils/validators.dart';
import '../../../components/custom_app_bar.dart';

class ChangePasswordScreen extends HookWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController =
        useTextEditingController();
    final TextEditingController newPasswordController =
        useTextEditingController();
    final TextEditingController confirmPasswordController =
        useTextEditingController();

    // Initialize function using useEffect hook
    useEffect(() {
      // Add your initialization logic here
      Provider.of<ChangePasswordViewmodel>(context, listen: false).initialize();

      // Cleanup function (optional)
      return () {
        // Add cleanup logic here (if needed)
      };
    }, []);

    return Unfocuser(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'Account'),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: AppColors.tertiary0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Form(
                        key: Provider.of<ChangePasswordViewmodel>(context,
                                listen: false)
                            .formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            const ProfileHeaderText(text: 'Change Password'),
                            SizedBox(height: 24.h),
                            OldPasswordBox(
                                oldPasswordController: oldPasswordController),
                            SizedBox(height: 24.h),
                            NewPasswordBox(
                                newPasswordController: newPasswordController),
                            SizedBox(height: 24.h),
                            ConfirmPasswordBox(
                                confirmPasswordController:
                                    confirmPasswordController),
                            SizedBox(height: 24.h),
                            const NoteBox(),
                            SizedBox(height: 24.h),
                            const UpdateButton(),
                            SizedBox(height: 16.h),
                            WideButtonOutlined(
                              text: 'Cancel',
                              onPressed: () {
                                log('Cancelling...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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

class OldPasswordBox extends StatelessWidget {
  const OldPasswordBox({
    Key? key,
    required this.oldPasswordController,
  }) : super(key: key);

  final TextEditingController oldPasswordController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordViewmodel>(
      builder: (context, model, child) {
        return PasswordTextField(
          textController: oldPasswordController,
          labelText: 'Old Password',
          hintText: 'Enter Password',
          isObscure: model.isOldPasswordObscure,
          onObscurePressedCallback: model.toggleOldPasswordObscure,
          textInputAction: TextInputAction.next,
          validatorCallback: Validators.validatePassword(
            isValidated: (value) {
              model.isOldPasswordValidated = value;
            },
            function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.oldPassword = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class NewPasswordBox extends StatelessWidget {
  const NewPasswordBox({
    Key? key,
    required this.newPasswordController,
  }) : super(key: key);

  final TextEditingController newPasswordController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordViewmodel>(
      builder: (context, model, child) {
        return PasswordTextField(
          textController: newPasswordController,
          labelText: 'New Password',
          hintText: 'Enter Password',
          isObscure: model.isNewPasswordObscure,
          onObscurePressedCallback: model.toggleNewPasswordObscure,
          textInputAction: TextInputAction.next,
          validatorCallback: Validators.validatePassword(
            isValidated: (value) {
              model.isNewPasswordValidated = value;
            },
            function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.newPassword = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class ConfirmPasswordBox extends StatelessWidget {
  const ConfirmPasswordBox({
    Key? key,
    required this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordViewmodel>(
      builder: (context, model, child) {
        return PasswordTextField(
          textController: confirmPasswordController,
          labelText: 'Confirm Password',
          hintText: 'Enter Password',
          isObscure: model.isConfirmPasswordObscure,
          onObscurePressedCallback: model.toggleConfirmPasswordObscure,
          textInputAction: TextInputAction.done,
          validatorCallback: Validators.validatePassword(
            isValidated: (value) {
              model.isConfirmPasswordValidated = value;
            },
            function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.confirmPassword = value;
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
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColors.primary2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'Please use letters, numbers and symbols only, with no space, minimum 6, maximum 32.\n\nYour password should not contain your username, email, name, address or year of birth. Use a mixture of letters, numbers and symbols to increase password strength. Please remember that passwords are case sensitive.',
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontSize: 10.sp,
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
    return Consumer<ChangePasswordViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Update',
          onPressed: () {
            if (!model.isCompleted) {
              log('Not Validated');
              model.formKey.currentState!.validate();
            } else {
              log('Updating...');
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
