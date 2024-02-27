import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum SelectedComment { all, important }

class SelectableCommentText extends StatefulWidget {
  const SelectableCommentText({super.key});

  @override
  _SelectableCommentTextState createState() => _SelectableCommentTextState();
}

class _SelectableCommentTextState extends State<SelectableCommentText> {
  SelectedComment selectedText = SelectedComment.all;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // All
          InkWell(
            onTap: () {
              setState(() {
                selectedText = SelectedComment.all;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                boxShadow: [
                  selectedText == SelectedComment.all
                      ? BoxShadow(
                          color: AppColors.tertiaryBase10.withOpacity(0.08),
                          blurRadius: 8.r,
                          offset: Offset(
                            0,
                            2.h,
                          ), // changes the position of the shadow
                        )
                      : const BoxShadow(color: Colors.transparent)
                ],
                borderRadius: BorderRadius.circular(24.r),
                color: selectedText == SelectedComment.all
                    ? AppColors.primaryBase6
                    : AppColors.tertiary3,
              ),
              padding: EdgeInsets.all(8.h),
              child: Center(
                child: Text(
                  'ALL COMMENTS',
                  style: TextStyle(
                    color: selectedText == SelectedComment.all
                        ? AppColors.tertiary1
                        : AppColors.tertiary8,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // Important
          InkWell(
            onTap: () {
              setState(() {
                selectedText = SelectedComment.important;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                boxShadow: [
                  selectedText == SelectedComment.important
                      ? BoxShadow(
                          color: AppColors.tertiaryBase10.withOpacity(0.08),
                          blurRadius: 8.r,
                          offset: Offset(
                              0, 2.h), // changes the position of the shadow
                        )
                      : const BoxShadow(color: Colors.transparent)
                ],
                borderRadius: BorderRadius.circular(24.r),
                color: selectedText == SelectedComment.important
                    ? AppColors.primaryBase6
                    : AppColors.tertiary3,
              ),
              padding: EdgeInsets.all(8.h),
              child: Text(
                'IMPORTANT ONLY',
                style: TextStyle(
                  color: selectedText == SelectedComment.important
                      ? AppColors.tertiary1
                      : AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
