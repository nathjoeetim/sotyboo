import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';
import '../../../../unils/utils.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.hintText,
    required this.isObscure,
    required this.onObscurePressedCallback,
    required this.textInputAction,
    this.validatorCallback,
    this.onChangedCallback,
    this.onSavedCallback,
  }) : super(key: key);

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final bool isObscure;
  final dynamic onObscurePressedCallback;
  final TextInputAction textInputAction;
  final String? Function(String?)? validatorCallback;
  final Function(String)? onChangedCallback;
  final Function(String?)? onSavedCallback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validatorCallback,
      onChanged: onChangedCallback,
      onSaved: onSavedCallback,
      obscureText: isObscure,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        color: AppColors.tertiaryBase10,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: AppColors.tertiary6,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.tertiary6,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.tertiary6,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: GestureDetector(
          onTap: onObscurePressedCallback,
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: SvgPicture.asset(
              getSvg('hide'),
              height: 20.h,
              width: 20.w,
              fit: BoxFit.scaleDown,
              color: isObscure ? AppColors.tertiary6 : AppColors.tertiaryBase10,
            ),
          ),
        ),
        contentPadding: EdgeInsets.all(16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            width: 1.h,
            color: AppColors.tertiary5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            width: 1.h,
            color: AppColors.tertiary5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            width: 1.h,
            color: AppColors.tertiary5,
          ),
        ),
      ),
    );
  }
}
