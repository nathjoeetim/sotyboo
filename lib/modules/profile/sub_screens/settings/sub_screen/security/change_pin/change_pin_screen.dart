import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/security/security_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class ChangePinScreen extends HookWidget {
  const ChangePinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamController<ErrorAnimationType> errorController =
        useStreamController<ErrorAnimationType>();

    useEffect(() {
      return () {
        /* Provider.of<VerifyEmailViewModel>(context, listen: false)
            .initialize(widget.email!, widget.fromSignInPage);*/
      };
    }, []);

    return CustomScaffold(
      title: 'Change PIN',
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Image.asset(
            getImage('logo-icon-main'),
            height: 80.h,
            width: 80.w,
          ),
          SizedBox(height: 16.h),
          const ProfileHeaderText(text: 'Enter PIN'),
          SizedBox(height: 56.h),
          PinCodeWidget(
              //errorController: errorController,
              ),
        ],
      ),
    );
  }
}

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    Key? key,
    //required this.errorController,
  }) : super(key: key);
  //final dynamic errorController;

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityViewmodel>(
        builder: (BuildContext context, model, Widget? child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: TextStyle(
            color: Colors.green.shade600,
            fontWeight: FontWeight.bold,
          ),
          length: 4,
          obscureText: true,
          obscuringWidget: CircleAvatar(
            radius: 4.h,
            backgroundColor: AppColors.tertiary1,
          ),
          //obscuringCharacter: '*',
          animationType: AnimationType.fade,
          // validator: (v) {
          // },
          showCursor: false,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(16.r),
            fieldHeight: 56.h,
            fieldWidth: 69.75.w,
            borderWidth: 2.5.w,
            activeFillColor: AppColors.primaryBase6,
            inactiveFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            activeColor: AppColors.primaryBase6,
            inactiveColor: AppColors.tertiary3,
            selectedColor: AppColors.primaryBase6.withOpacity(0.4),
          ),
          //cursorColor: AppColors.black,
          animationDuration: const Duration(milliseconds: 200),
          textStyle: TextStyle(
            fontSize: 20.sp,
            height: 1.5.h,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          autoFocus: false,
          //errorAnimationController: errorController,
          //controller: textEditingController,
          keyboardType: TextInputType.phone,
          onCompleted: (v) {
            //When all boxes are filled
            debugPrint("Completed");
          },
          onTap: () {
            debugPrint("Pressed");

            //model.setHasError(hasError: false);
          },
          onChanged: (value) {
            debugPrint(value);

            //model.setCodeText(codeInput: value);
            //model.changeButton();
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      );
    });
    /* return Consumer<SecurityViewmodel>(
        builder: (BuildContext context, model, Widget? child) {
      return PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 4,
        obscureText: false,
        obscuringCharacter: '*',
        animationType: AnimationType.fade,
        // validator: (v) {
        // },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5.r),
          fieldHeight: 56.h,
          fieldWidth: 47.w,
          borderWidth: 1.w,
          activeFillColor: model.hasError ? Colors.orange : AppColors.fillAsh,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          activeColor: AppColors.secondaryBlue,
          inactiveColor: AppColors.borderAsh,
          selectedColor: AppColors.secondaryBlue,
        ),
        cursorColor: AppColors.black,
        animationDuration: const Duration(milliseconds: 200),
        textStyle: TextStyle(
          fontSize: 20.sp,
          height: 1.5.h,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        autoFocus: false,
        errorAnimationController: errorController,
        //controller: textEditingController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          //When all boxes are filled
          debugPrint("Completed");
        },
        onTap: () {
          debugPrint("Pressed");

          model.setHasError(hasError: false);
        },
        onChanged: (value) {
          debugPrint(value);

          model.setCodeText(codeInput: value);
          model.changeButton();
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      );
    });
    */
  }
}

/*class CompletedWideButton extends StatelessWidget {
  const CompletedWideButton({Key? key, required this.errorController})
      : super(key: key);
  final dynamic errorController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<VerifyEmailViewModel>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 16.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
      onPressed: model.isCompleted
          ? () {
        log('Verifying....');

        final authViewmodel =
        Provider.of<AuthViewModel>(context, listen: false);

        authViewmodel
            .verifyOTP(email: model.email, otp: model.codeText)
            .then((value) {
          // If OTP verification is Successful
          if (value.isSuccess) {
            model.setHasError(hasError: false);

            showCustomSnackBar(
              context,
              message: value.message!,
              title: 'Perfect',
              isError: false,
            );

            // If the previous page was the Sign up page
            if (!model.fromSignInPage) {
              // Move to the Sign in Page
              Navigator.pushReplacementNamed(
                context,
                SignInScreen.routeName,
              );
            } else {
              // If the previous Page was the Sign in page
              // Move us to the Client's Home Page

              Provider.of<ClientViewmodel>(context, listen: false)
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
            }

            // Show the Token Dialog
            showDialog(
                context: context,
                builder: (context) {
                  return TokenDialog(
                    onContinuePressed: () {
                      //////////
                      // Dismiss the dialog if it is still open
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    onStandardPressed: () {
                      /////////
                      // Dismiss the dialog if it is still open
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    onAdvancedPressed: () {
                      ///////////////
                      // Dismiss the dialog if it is still open
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    onPremiumPressed: () {
                      /////////////

                      // Dismiss the dialog if it is still open
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  );
                });

            log('Successful Verification');
            //Navigator.pushNamed(context, HomeScreen.routeName);
          } else {
            // Triggering error shake animation
            errorController.add(ErrorAnimationType.shake);
            model.setHasError(hasError: true);

            showCustomSnackBar(context, message: value.message!);
          }
        });
      }
          : null,
      child: Text(
        'Verify Email',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: AppColors.white,
        ),
      ),
    );
  }
}*/
