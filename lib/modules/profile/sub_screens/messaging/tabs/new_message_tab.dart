import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class NewMessageTab extends StatelessWidget {
  const NewMessageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'New Message',
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.h),
            const SubjectBox(),
            SizedBox(height: 16.h),
            const MessageBox(),
            SizedBox(height: 24.h),
            const SendButton(),
            SizedBox(height: 16.h),
            const SaveButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class SubjectBox extends HookWidget {
  const SubjectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<MessagingViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Subject',
          hintText: '',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          /*  validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            //model.dayLimit = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class MessageBox extends HookWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = useTextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary0,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.h,
          color: AppColors.tertiary5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message',
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.tertiary6,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            maxLines: 8,
            minLines: 4,
            //focusNode: focusNode,
            controller: messageController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                /* // Process the submitted comment
                log('Sending a message: $value');

                model.sendMessage();
                textController.clear();
                focusNode.unfocus();

                model.message = '';
                model.resetCurrentMessage();*/
              }
            },
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              // Remove Underline
              decorationThickness: 0.0,
            ),
            cursorColor: AppColors.primaryBase6,
            onChanged: (value) {
              //model.message = value;
              //model.updateCurrentMessage(message: value);
              // model.notifyListeners();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.w,
                vertical: 0.h,
              ),
              border: InputBorder.none,
              // Remove unnecessary spacing or padding in the Textfield
              // Makes the Textfield compact
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Send',
          onPressed: () {
            /* if (model.formKey.currentState!.validate()) {
              log('Updating...');
              model.toMainPage();
            } else {
              log('Not Validated');
            }*/
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

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButtonOutlined(
          text: 'Save to draft',
          onPressed: () {},
        );
      },
    );
  }
}
