import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_bottom_sheet.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

onInviteFriendsPressed({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        topRight: Radius.circular(32.r),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.768,
      //minChildSize: 1,
      maxChildSize: 0.768,
      builder: (context, scrollController) => const InviteFriendsBottomSheet(),
    ),
  );
}

class InviteFriendsBottomSheet extends StatelessWidget {
  const InviteFriendsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Invite Friends',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              Image.asset(
                getImage('invite'),
                height: 94.83.h,
                width: 119.09.w,
              ),
              SizedBox(height: 16.h),
              Text(
                'Invite your friends to SiuuuSport App and get reward with SiuuuSport coin.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              ),
              SizedBox(height: 16.h),
              const SearchTextBox(),
              SizedBox(height: 16.h),
              const Chips(),
              SizedBox(height: 16.h),
              const CustomMessage(),
              SizedBox(height: 16.h),
              Row(
                children: [
                  // Copy link button
                  const CopyLinkButton(),
                  SizedBox(width: 16.w),
                  const SendButton(),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTextBox extends HookWidget {
  const SearchTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 12.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary3,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.tertiaryTint5,
            offset: Offset(0, 2.h), // The x and y offset of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            getSvg('search-thick'),
            height: 16.h,
            width: 16.w,
            color: AppColors.tertiary5,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              //maxLines: 4,
              //minLines: 1,
              //focusNode: focusNode,
              controller: searchController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  // Process the submitted comment
                  // log('Sending a message: $value');
                  //
                  // model.sendMessage();
                  // textController.clear();
                  // focusNode.unfocus();
                  //
                  // model.message = '';
                  // model.resetCurrentMessage();
                }
              },
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                // Remove Underline
                decorationThickness: 0.0,
              ),
              cursorColor: AppColors.primaryBase6,
              onChanged: (value) {
                //model.message = value;
                //model.updateCurrentMessage(message: value);
                // model.notifyListeners();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0.w,
                  vertical: 0.h,
                ),
                hintText: 'Search by email',
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  color: AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                // Remove unnecessary spacing or padding in the Textfield
                // Makes the Textfield compact
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Chips extends StatelessWidget {
  const Chips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip(
          email: 'ja****.com',
          onCancelPressed: () {
            /// CANCEL
          },
        ),
        SizedBox(width: 16.w),
        _addButton(onPressed: () {
          /// ADD
        }),
      ],
    );
  }

  Widget _chip({
    required String email,
    required VoidCallback onCancelPressed,
  }) =>
      Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          color: AppColors.success1,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryBase6,
              radius: 16.r,
              child: Text(
                email.isNotEmpty ? email[0].toUpperCase() : '',
                style: TextStyle(
                  color: AppColors.tertiary0,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              email,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: onCancelPressed,
              child: SvgPicture.asset(
                getSvg('close-circle-green'),
                height: 32.h,
                width: 32.w,
              ),
            ),
          ],
        ),
      );

  Widget _addButton({required VoidCallback onPressed}) => InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: AppColors.tertiary3,
          radius: 16.r,
          child: Image.asset(
            getImage('add-circle'),
            height: 24.h,
            width: 24.w,
          ),
        ),
      );
}

class CustomMessage extends HookWidget {
  const CustomMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = useTextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary0,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.h,
          color: AppColors.tertiary5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Custom Message (Optional)',
            style: TextStyle(
              color: AppColors.tertiary6,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            maxLines: 8,
            minLines: 4,
            //focusNode: focusNode,
            controller: messageController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                /* // Process the submitted comment
                log('Sending a message: $value');

                model.sendMessage();
                textController.clear();
                focusNode.unfocus();

                model.message = '';
                model.resetCurrentMessage();*/
              }
            },
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              // Remove Underline
              decorationThickness: 0.0,
            ),
            cursorColor: AppColors.primaryBase6,
            onChanged: (value) {
              //model.message = value;
              //model.updateCurrentMessage(message: value);
              // model.notifyListeners();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.w,
                vertical: 0.h,
              ),
              border: InputBorder.none,
              // Remove unnecessary spacing or padding in the Textfield
              // Makes the Textfield compact
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CopyLinkButton extends StatelessWidget {
  const CopyLinkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ///////
        },
        child: Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 24.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary1,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 1.h,
              color: AppColors.primaryBase6,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                getSvg('link'),
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Copy link',
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.primaryBase6,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ///////
        },
        child: Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 24.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryBase6,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Send',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors.tertiary1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  getSvg('send-comment'),
                  height: 24.h,
                  width: 24.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
