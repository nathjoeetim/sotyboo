import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/drop_down_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/preferences/preferences_viewmodel.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../unils/validators.dart';
import '../../../components/custom_app_bar.dart';

class PreferencesScreen extends HookWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController languageController = useTextEditingController();
    final TextEditingController timeZoneController = useTextEditingController();
    final TextEditingController oddsDisplayController =
        useTextEditingController();
    final TextEditingController inactivityPeriodController =
        useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    // Initialize function using useEffect hook
    useEffect(() {
      // Add your initialization logic here
      Provider.of<PreferencesViewmodel>(context, listen: false).initialize();

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
                  child: Form(
                    key: Provider.of<PreferencesViewmodel>(context,
                            listen: false)
                        .formKey,
                    child: Container(
                      color: AppColors.tertiary0,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                const ProfileHeaderText(text: 'Preferences'),
                                SizedBox(height: 24.h),
                                LanguageBox(
                                    languageController: languageController),
                                SizedBox(height: 24.h),
                                TimeZoneBox(
                                    timeZoneController: timeZoneController),
                                SizedBox(height: 24.h),
                                OddsDisplayBox(
                                    oddsDisplayController:
                                        oddsDisplayController),
                                SizedBox(height: 24.h),
                                InactivityPeriodBox(
                                    inactivityPeriodController:
                                        inactivityPeriodController),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                          Consumer<PreferencesViewmodel>(
                              builder: (context, model, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.h),
                                  child: Text(
                                    'How to recieve offers',
                                    style: TextStyle(
                                      color: AppColors.tertiaryBase10,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                _greyTile('External Communication'),
                                ToggleTile(
                                  label: 'Notification',
                                  toggle: model.notificationToggle,
                                  onChanged: (value) =>
                                      model.notificationToggle = value,
                                ),
                                ToggleTile(
                                  label: 'SMS',
                                  toggle: model.smsToggle,
                                  onChanged: (value) => model.smsToggle = value,
                                ),
                                ToggleTile(
                                  label: 'Email',
                                  toggle: model.emailToggle,
                                  onChanged: (value) =>
                                      model.emailToggle = value,
                                ),
                                _greyTile('In-App Communication'),
                                ToggleTile(
                                  label: 'Messages in SiuuuSport',
                                  toggle: model.messagesToggle,
                                  onChanged: (value) =>
                                      model.messagesToggle = value,
                                ),
                                ToggleTile(
                                  label: 'Offer Pop Ups',
                                  toggle: model.popUpsToggle,
                                  onChanged: (value) =>
                                      model.popUpsToggle = value,
                                ),
                                SizedBox(height: 16.h),
                              ],
                            );
                          }),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PasswordBox(
                                    passwordController: passwordController),
                                SizedBox(height: 24.h),
                                const UpdateButton(),
                                SizedBox(height: 16.h),
                                WideButtonOutlined(
                                  text: 'Cancel',
                                  onPressed: () {
                                    log('Cancelling...');
                                  },
                                ),
                                SizedBox(height: 16.h),
                              ],
                            ),
                          ),
                        ],
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

  Widget _greyTile(String text) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        color: AppColors.tertiary3,
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

class LanguageBox extends StatelessWidget {
  const LanguageBox({
    Key? key,
    required this.languageController,
  }) : super(key: key);

  final TextEditingController languageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: languageController,
          labelText: 'Language',
          hintText: 'Select language',
          items: model.languageItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            languageController.text = selectedItem;
            model.setLanguage(selectedLanguage: selectedItem);
          },
        );
      },
    );
  }
}

class TimeZoneBox extends StatelessWidget {
  const TimeZoneBox({
    Key? key,
    required this.timeZoneController,
  }) : super(key: key);

  final TextEditingController timeZoneController;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: timeZoneController,
          labelText: 'Time Zone',
          hintText: 'Set Time Zone',
          items: model.timeZoneItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            timeZoneController.text = selectedItem;
            model.setTimeZone(selectedTimeZone: selectedItem);
          },
        );
      },
    );
  }
}

class OddsDisplayBox extends StatelessWidget {
  const OddsDisplayBox({
    Key? key,
    required this.oddsDisplayController,
  }) : super(key: key);

  final TextEditingController oddsDisplayController;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: oddsDisplayController,
          labelText: 'Odds display',
          hintText: 'Decimal',
          items: model.oddsDisplayItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            oddsDisplayController.text = selectedItem;
            model.setOddsDisplay(selectedOddsDisplay: selectedItem);
          },
        );
      },
    );
  }
}

class InactivityPeriodBox extends StatelessWidget {
  const InactivityPeriodBox({
    Key? key,
    required this.inactivityPeriodController,
  }) : super(key: key);

  final TextEditingController inactivityPeriodController;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: inactivityPeriodController,
          labelText: 'Maximum Inactivity Period',
          hintText: '20 minutes',
          items: model.inactivityPeriodItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            inactivityPeriodController.text = selectedItem;
            model.setInactivityPeriod(selectedInactivityPeriod: selectedItem);
          },
        );
      },
    );
  }
}

class ToggleTile extends StatelessWidget {
  const ToggleTile({
    Key? key,
    required this.label,
    required this.toggle,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool toggle;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        width: 1.h,
        color: AppColors.tertiary3,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          FlutterSwitch(
            width: 42.w,
            height: 24.h,
            toggleSize: 21.h,
            borderRadius: 32.r,
            padding: 1.h,
            activeColor: AppColors.primaryBase6,
            inactiveColor: AppColors.tertiary3,
            activeToggleColor: AppColors.primary2,
            inactiveToggleColor: AppColors.tertiary1,
            value: toggle,
            onToggle: onChanged,
          ),
        ],
      ),
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
    return Consumer<PreferencesViewmodel>(
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
              log('IS_VALIDATED --> $value');
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
    return Consumer<PreferencesViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Update',
          onPressed: () {
            log('IS_COMPLETED --> ${model.isCompleted}');
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
