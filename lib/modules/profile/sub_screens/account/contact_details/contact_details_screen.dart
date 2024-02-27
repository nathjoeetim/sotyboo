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
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/contact_details/contact_details_viewmodel.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../unils/validators.dart';
import '../../../components/custom_app_bar.dart';

class ContactDetailsScreen extends HookWidget {
  const ContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    // Initialize function using useEffect hook
    useEffect(() {
      // Add your initialization logic here
      Provider.of<ContactDetailsViewModel>(context, listen: false).initialize();

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
                        key: Provider.of<ContactDetailsViewModel>(context,
                                listen: false)
                            .formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            const ProfileHeaderText(text: 'Contact Details'),
                            SizedBox(height: 24.h),
                            PhoneNumberBox(phoneController: phoneController),
                            SizedBox(height: 24.h),
                            EmailBox(emailController: emailController),
                            SizedBox(height: 24.h),
                            PasswordBox(passwordController: passwordController),
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

class PhoneNumberBox extends StatelessWidget {
  const PhoneNumberBox({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactDetailsViewModel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: phoneController,
          labelText: 'Phone Number',
          hintText: 'Enter Phone Number',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.phone = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class EmailBox extends StatelessWidget {
  const EmailBox({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactDetailsViewModel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: emailController,
          labelText: 'Email',
          hintText: 'Enter Email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validatorCallback: Validators.validateEmail(
            isValidated: (value) {
              model.isEmailValidated = value;
            },
            function: model.updateButton,
          ),
          onChangedCallback: (value) {
            model.email = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class PasswordBox extends StatelessWidget {
  const PasswordBox({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactDetailsViewModel>(
      builder: (context, model, child) {
        return PasswordTextField(
          textController: passwordController,
          labelText: 'Password',
          hintText: 'Enter Password',
          isObscure: model.isPasswordObscure,
          onObscurePressedCallback: model.togglePasswordObscure,
          textInputAction: TextInputAction.done,
          validatorCallback: Validators.validatePassword(
            isValidated: (value) {
              model.isPasswordValidated = value;
            },
            function: model.updateButton,
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
    return Consumer<ContactDetailsViewModel>(
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
