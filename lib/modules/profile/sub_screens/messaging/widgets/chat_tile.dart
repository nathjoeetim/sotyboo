import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/model/notification_model.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.chat,
    this.isDraft = false,
    required this.isSelected,
    required this.showCheckbox,
    required this.onPressed,
    required this.onLongPressed,
  }) : super(key: key);

  final ProfileChatModel chat;
  final bool isDraft;
  final bool isSelected;
  final bool showCheckbox;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPressed,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 8.h,
          left: 16.w,
          right: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiaryBase10.withOpacity(0.08),
              blurRadius: 16.r,
              offset: Offset(0, 4.w),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(16.h),
          decoration: isSelected
              ? BoxDecoration(
                  color: AppColors.tertiary1,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryTint7,
                      blurRadius: 0,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                )
              : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showCheckbox)
                InkWell(
                  onTap: onLongPressed,
                  child: Container(
                      height: 24.h,
                      width: 24.w,
                      margin: EdgeInsets.only(right: 16.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryBase6
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          width: 1.h,
                          color: AppColors.primaryBase6,
                        ),
                      ),
                      child: isSelected
                          ? SvgPicture.asset(
                              getSvg('check'),
                              height: 15.h,
                              width: 15.w,
                              fit: BoxFit.scaleDown,
                            )
                          : const SizedBox.shrink()),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'SiuuSports',
                          style: TextStyle(
                            color: AppColors.tertiaryBase10,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (chat.hasRead == null || !chat.hasRead!)
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: CircleAvatar(
                              radius: 4.r,
                              backgroundColor: AppColors.dangerBase3,
                            ),
                          ),
                        const Spacer(),
                        Text(
                          '21 mins',
                          style: TextStyle(
                            color: AppColors.tertiary6,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      '${chat.title}',
                      style: TextStyle(
                        color: AppColors.tertiaryBase10,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Hey Jake,\nTo deposit money follow the steps..',
                      style: TextStyle(
                        color: AppColors.tertiary8,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                    if (isDraft)
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Text(
                          'Draft',
                          style: TextStyle(
                            color: AppColors.success4,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
