//The Message bubble class
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.item,
    //required this.sender,
    //required this.text,
    //required this.time,
  });

  final Message item;
  // final String sender;
  // final String text;
  //final String time;

  @override
  Widget build(BuildContext context) {
    //If the sender field is same as the current user, i.e if i am the one sending, then isMe is true, else false
    final bool isMe = item.sender == 'You';

    return Padding(
      //Padding between each messages
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 18.h,
      ),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          // crossAxisAlignment:
          //     isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:
              isMe ? _messageRow(isMe).reversed.toList() : _messageRow(isMe),
        ),
      ),
    );
  }

  List<Widget> _messageRow(bool isMe) => [
        // Profile
        Image.asset(
          getImage('user-profile-pics'),
          height: 32.h,
          width: 32.w,
        ),
        SizedBox(width: 8.w),
        // Message
        Expanded(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: AppColors.tertiary1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMe ? 16.r : 0),
                    topRight: Radius.circular(isMe ? 0 : 16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tertiaryBase10.withOpacity(0.08),
                      blurRadius: 16.r,
                      offset: Offset(0, 4.w),
                    )
                  ],
                ),
                child: Text(
                  item.message ?? '',
                  style: TextStyle(
                    color: AppColors.tertiary8,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.21,
                  ),
                ),
              ),
              SizedBox(height: 8.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isMe) _userName(),
                  _time(),
                  if (isMe) _userName(),
                ],
              ),
            ],
          ),
        ),
        /*SizedBox(width: 8.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isMe) _userName(),
            _time(),
            if (!isMe) _userName(),
          ],
        ),*/
      ];

  Text _userName() => Text(
        item.sender ?? '',
        style: TextStyle(
          color: AppColors.primaryBase6,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      );

  Text _time() => Text(
        item.time ?? '',
        style: TextStyle(
          color: AppColors.tertiary6,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      );
}
