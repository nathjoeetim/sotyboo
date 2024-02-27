import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.textInputAction,
    this.inputFormatters,
    this.validatorCallback,
    this.onChangedCallback,
    this.onSavedCallback,
  }) : super(key: key);

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
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
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
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
