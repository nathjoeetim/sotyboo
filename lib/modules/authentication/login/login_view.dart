import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../components/base_widget.dart';
import '../../../components/button_widget.dart';
import '../../../components/heading_widget.dart';
import '../../../core/home/home_page.dart';
import '../../../core/home/sportboo_user_provider.dart';
import '../../../core/theme/colors.dart';
import '../../../models/sportboo_user/sportboo_user.dart';
import '../../../unils/utils.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(context),
      builder: (BuildContext context, LoginViewModel viewModel, Widget? child) {

        return Scaffold(
            backgroundColor: AppColors.tertiary0,
            appBar: AppBar(
              backgroundColor: AppColors.tertiary0,
              leading: const SizedBox(),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.h),
                child: ReactiveForm(
                  formGroup: viewModel.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeadingWidget(
                        'Login',
                        subheading: 'Welcome, login to access your account.',
                      ),
                      Gap(32.h),
                      ReactiveTextField(
                        autocorrect: false,
                        textAlignVertical: TextAlignVertical.center,
                        formControlName: 'email',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.tertiaryBase10),
                        decoration: authFormFieldInputDecoration(
                            hintText: 'Enter Email',
                            labelText: 'Email',
                            context: context),
                        validationMessages: {
                          'required': (error) => 'The email must not be empty',
                          'email': (error) => 'Invalid input'
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Gap(24.h),
                      ReactiveTextField(
                        autocorrect: false,
                        textAlignVertical: TextAlignVertical.center,
                        formControlName: 'password',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !viewModel.showHidePassword,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.tertiaryBase10),
                        decoration: authFormFieldInputDecoration(
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            context: context,
                            suffixIcon: IconButton(
                                onPressed: viewModel.toggleShowHidePassword,
                                icon: viewModel.showHidePassword
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                        validationMessages: {
                          'required': (error) => 'The password must not be empty',
                          'minLength': (error) =>
                          'The password must have at least 6 characters',
                          'maxLength': (error) =>
                          'The password must have at most 20 characters'
                        },
                      ),
                      Gap(16.h),
                      InkWell(
                        onTap: () {
                          // PageRouter.gotoWidget(
                          //   context,
                          //   const ForgetPasswordView(),
                          // );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColors.primaryBase6),
                        ),
                      ),
                      Gap(24.h),
                      AppButton(
                          text: 'Login',
                          onTap: () => viewModel.onLoginUser()),
                      Gap(24.h),
                      const Center(
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.tertiary9),
                        ),
                      ),
                      Gap(24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildSocialLoginContainer('apple'),
                          ),
                          const Gap(16),
                          Expanded(
                            child: _buildSocialLoginContainer('Facebook'),
                          ),
                          const Gap(16),
                          Expanded(
                            child: _buildSocialLoginContainer('google'),
                          ),
                        ],
                      ),
                      Gap(32.h),
                      Center(
                        child: RichText(
                          text:const TextSpan(
                            children: [
                               TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColors.tertiary9)),
                              TextSpan(
                                text: 'Sign up',
                                style:  TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.primaryBase6),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () => PageRouter.gotoWidget(
                                //     context,
                                //     RegistrationView(),
                                  // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Container _buildSocialLoginContainer(String icon) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.tertiary3,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          getSvg(icon),
          height: 32,
          width: 32,
        ),
      ),
    );
  }

}
