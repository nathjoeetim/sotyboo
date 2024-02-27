import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum SelectPlayerStat { all, goals, rating, assist }

class SelectablePlayerStatText extends StatefulWidget {
  const SelectablePlayerStatText({super.key});

  @override
  _SelectablePlayerStatTextState createState() =>
      _SelectablePlayerStatTextState();
}

class _SelectablePlayerStatTextState extends State<SelectablePlayerStatText> {
  SelectPlayerStat selectedText = SelectPlayerStat.all;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // All
            InkWell(
              onTap: () {
                setState(() {
                  selectedText = SelectPlayerStat.all;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    selectedText == SelectPlayerStat.all
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
                  color: selectedText == SelectPlayerStat.all
                      ? AppColors.primaryBase6
                      : AppColors.tertiary3,
                ),
                padding: EdgeInsets.all(8.h),
                child: Center(
                  child: Text(
                    'ALL',
                    style: TextStyle(
                      color: selectedText == SelectPlayerStat.all
                          ? AppColors.tertiary1
                          : AppColors.tertiary8,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

            ),
            // Goals
            InkWell(
              onTap: () {
                setState(() {
                  selectedText = SelectPlayerStat.goals;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    selectedText == SelectPlayerStat.goals
                        ? BoxShadow(
                            color: AppColors.tertiaryBase10.withOpacity(0.08),
                            blurRadius: 8.r,
                            offset: Offset(
                                0, 2.h), // changes the position of the shadow
                          )
                        : const BoxShadow(color: Colors.transparent)
                  ],
                  borderRadius: BorderRadius.circular(24.r),
                  color: selectedText == SelectPlayerStat.goals
                      ? AppColors.primaryBase6
                      : AppColors.tertiary3,
                ),
                padding: EdgeInsets.all(8.h),
                child: Text(
                  'GOALS',
                  style: TextStyle(
                    color: selectedText == SelectPlayerStat.goals
                        ? AppColors.tertiary1
                        : AppColors.tertiary8,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Player Rating
            InkWell(
              onTap: () {
                setState(() {
                  selectedText = SelectPlayerStat.rating;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    selectedText == SelectPlayerStat.rating
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

                  color: selectedText == SelectPlayerStat.rating
                      ? AppColors.primaryBase6
                      : AppColors.tertiary3,
                ),
                padding: EdgeInsets.all(8.h),
                child: Text(
                  'PLAYERS RATING',
                  style: TextStyle(
                    color: selectedText == SelectPlayerStat.rating
                        ? AppColors.tertiary1
                        : AppColors.tertiary8,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),


            // Assists
            InkWell(
              onTap: () {
                setState(() {
                  selectedText = SelectPlayerStat.assist;
                });
              },
              child: Container(
                //margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    selectedText == SelectPlayerStat.assist
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

                  color: selectedText == SelectPlayerStat.assist
                      ? AppColors.primaryBase6
                      : AppColors.tertiary3,
                ),
                padding: EdgeInsets.all(8.h),
                child: Text(
                  'ASSISTS',
                  style: TextStyle(
                    color: selectedText == SelectPlayerStat.assist
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
      ),
    );
  }
}
