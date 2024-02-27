import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/drop_down_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/password_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/residential_address/residential_address_viewmodel.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../unils/validators.dart';
import '../../../components/custom_app_bar.dart';

class ResidentialAddressScreen extends HookWidget {
  const ResidentialAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController countryController = useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    final TextEditingController stateController = useTextEditingController();
    final TextEditingController cityController = useTextEditingController();
    final TextEditingController postCodeController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    // Initialize function using useEffect hook
    useEffect(() {
      // Add your initialization logic here
      Provider.of<ResidentialAddressViewmodel>(context, listen: false)
          .initialize();

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
                        key: Provider.of<ResidentialAddressViewmodel>(context,
                                listen: false)
                            .formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            const ProfileHeaderText(
                                text: 'Residential Details'),
                            SizedBox(height: 24.h),
                            CountryBox(countryController: countryController),
                            SizedBox(height: 8.h),
                            const ContactUsRichText(),
                            SizedBox(height: 24.h),
                            AddressBox(addressController: addressController),
                            SizedBox(height: 24.h),
                            StateBox(stateController: stateController),
                            SizedBox(height: 24.h),
                            CityBox(cityController: cityController),
                            SizedBox(height: 24.h),
                            PostCodeBox(postCodeController: postCodeController),
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
                            SizedBox(height: 16.h),
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

class CountryBox extends StatelessWidget {
  const CountryBox({
    Key? key,
    required this.countryController,
  }) : super(key: key);

  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentialAddressViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: countryController,
          labelText: 'Country of Residence',
          hintText: 'Port Harcourt',
          items: model.countryItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            countryController.text = selectedItem;
            model.setCountry(selectedCountry: selectedItem);
          },
        );
      },
    );
  }
}

class ContactUsRichText extends StatelessWidget {
  const ContactUsRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
              color: AppColors.tertiary7,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
            children: [
          const TextSpan(text: 'To change your country of residence, please'),
          TextSpan(
            text: ' Contact us',
            style: TextStyle(
              color: AppColors.primaryBase6,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle the tap on the "here" text.
                log('Clicked "here"');
              },
          )
        ]));
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox({
    Key? key,
    required this.addressController,
  }) : super(key: key);

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentialAddressViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: addressController,
          labelText: 'Address',
          hintText: 'Enter Address',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          /* validatorCallback: Validators.validatePhone(
            isValidated: (value) {
             // model.isPhoneValidated = value;
            },
            //function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            model.address = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class StateBox extends StatelessWidget {
  const StateBox({
    Key? key,
    required this.stateController,
  }) : super(key: key);

  final TextEditingController stateController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentialAddressViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: stateController,
          labelText: 'State/Region',
          hintText: 'Rivers',
          items: model.stateItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            stateController.text = selectedItem;
            model.setState(selectedState: selectedItem);
          },
        );
      },
    );
  }
}

class CityBox extends StatelessWidget {
  const CityBox({
    Key? key,
    required this.cityController,
  }) : super(key: key);

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentialAddressViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: cityController,
          labelText: 'Town/City',
          hintText: 'Port Harcourt',
          items: model.cityItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            cityController.text = selectedItem;
            model.setCity(selectedCity: selectedItem);
          },
        );
      },
    );
  }
}

class PostCodeBox extends StatelessWidget {
  const PostCodeBox({
    Key? key,
    required this.postCodeController,
  }) : super(key: key);

  final TextEditingController postCodeController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentialAddressViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: postCodeController,
          labelText: 'Postcode',
          hintText: 'Enter Post Code',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          /*  validatorCallback: Validators.validatePhone(
            isValidated: (value) {
              model.isPhoneValidated = value;
            },
            function: model.updateButton,
          ),*/
          onChangedCallback: (value) {
            model.postCode = value;
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
    return Consumer<ResidentialAddressViewmodel>(
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
    return Consumer<ResidentialAddressViewmodel>(
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
