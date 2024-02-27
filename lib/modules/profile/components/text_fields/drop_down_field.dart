import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/matches/components/league_chooser_dialog.dart';
import 'package:sportboo_mobile_client/modules/profile/components/item_chooser_dialog.dart';

import '../../../../core/theme/colors.dart';
import '../../../../unils/utils.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final List<String> items;
  final ValueChanged<String> onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ItemChooserDialog(
              items: items,
              onPressed: onPressed,
            );
          },
        );
      },
      child: TextFormField(
        controller: textController,
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColors.tertiary6,
        decoration: InputDecoration(
          enabled: false,
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
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.h),
            child: SvgPicture.asset(
              getSvg('arrow-down'),
              height: 20.h,
              width: 20.w,
              fit: BoxFit.scaleDown,
              color: AppColors.tertiary6,
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              width: 1.h,
              color: AppColors.tertiary5,
            ),
          ),
        ),
      ),
    );
  }
}
