import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class CustomTabContainer extends StatelessWidget {
  const CustomTabContainer({
    Key? key,
    required this.labels,
    required this.currentPosition,
    required this.pages,
    required this.onPressed,
  }) : super(key: key);

  final List<String> labels;
  final int currentPosition;
  final List<Widget> pages;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Tabs,
          ProfileSelectableTextContainer(
            labels: labels,
            currentPosition: currentPosition,
            onPressed: onPressed,
          ),
          //PageView
          Expanded(
            child: IndexedStack(
              //This will keep the state of the individual screens while switched
              index: currentPosition,
              children: pages,
            ),
          ),
          /* Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  child: IndexedStack(
                    //This will keep the state of the individual screens while switched
                    index: currentPosition,
                    children: pages,
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}

class ProfileSelectableTextContainer extends StatelessWidget {
  const ProfileSelectableTextContainer({
    Key? key,
    required this.labels,
    required this.currentPosition,
    required this.onPressed,
  }) : super(key: key);

  final List<String> labels;
  final int currentPosition;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.all(16.h),
        child: Row(
          children: List.generate(
            labels.length,
            (index) => TabItem(
              title: labels[index],
              isSelected: currentPosition == index,
              onPressed: () => onPressed(index),
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.tertiary1,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                    color: AppColors.tertiaryBase10.withOpacity(0.08),
                  ),
                ],
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.primaryBase6 : AppColors.tertiary8,
          ),
        ),
      ),
    );
  }
}
