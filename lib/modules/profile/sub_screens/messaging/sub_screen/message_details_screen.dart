import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/trash.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/message_details_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/widgets/message_bubble.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/model/notification_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/notifications/viewmodels/notifications_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';
import 'package:provider/provider.dart';

class MessageDetailsScreen extends HookWidget {
  const MessageDetailsScreen({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ProfileChatModel chat;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<MessageDetailsViewmodel>(context, listen: false)
          .initialize(chat);
      return null;
    });

    return KeyboardDismissOnTap(
      child: CustomScaffold(
        title: 'SiuuSports',
        trailing: Trash(
          onPressed: () {
            log('Deleting...');
            Provider.of<MessagingViewmodel>(context, listen: false)
                .deleteChat(chat);
          },
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: ChatWidget(),
            ),
            MessageBar(),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageDetailsViewmodel>(
      builder: (context, model, child) {
        if (model.messages!.isEmpty) {
          //If no data has being returned yet
          return Container();
        }

        return ListView(
          reverse: true,
          shrinkWrap: true,
          children: model.messages!.reversed.map<Widget>((item) {
            //log('${item.sender} =  ---->  ${item.message}');

            return MessageBubble(
              item: item,
            );
          }).toList(),
        );
      },
    );
  }
}

class MessageBar extends HookWidget {
  const MessageBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return Consumer<MessageDetailsViewmodel>(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary7,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              model.currentMessage.photo != null
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120.h,
                            margin: EdgeInsets.only(bottom: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.file(
                                model.currentMessage.photo!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //SizedBox(width: 8.w),
                          InkWell(
                            onTap: () {
                              log('Deleting Photo...');
                              model.removeAttachedPhoto();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.h),
                              child: SvgPicture.asset(
                                'assets/svgs/close-circle.svg',
                                height: 24.h,
                                width: 24.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      log('SELECT PHOTO');
                      model.selectImage();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: SvgPicture.asset(
                        'assets/svgs/gallery-add.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.all(8.h),
                      decoration: ShapeDecoration(
                        color: AppColors.tertiary2,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.h,
                            color: AppColors.primaryBase6,
                          ),
                          //borderRadius: BorderRadius.circular(32),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: TextField(
                        maxLines: 4,
                        minLines: 1,
                        controller: textEditingController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            // Process the submitted comment
                            log('Sending a message: $value');

                            model.sendMessage();
                            textEditingController.clear();

                            //model.chat = '';
                            model.resetCurrentMessage();
                          }
                        },
                        style: TextStyle(
                          color: AppColors.tertiaryBase10,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          // Remove Underline
                          decorationThickness: 0.0,
                        ),
                        cursorColor: AppColors.primaryBase6,
                        onChanged: (value) {
                          //model.chat = value;
                          model.updateCurrentMessage(message: value);
                          // model.notifyListeners();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          hintText: 'Add Comment',
                          hintMaxLines: 1,
                          hintStyle: TextStyle(
                            color: const Color(0xFF555555),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          // Remove unnecessary spacing or padding in the Textfield
                          // Makes the Textfield compact
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: (model.currentMessage.message != null &&
                            model.currentMessage.message!.isNotEmpty)
                        ? () {
                            log('Sending a message');

                            model.sendMessage();
                            textEditingController.clear();

                            //model.chat = '';
                            model.resetCurrentMessage();
                          }
                        : null,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: (model.currentMessage.message != null &&
                              model.currentMessage.message!.isNotEmpty)
                          ? AppColors.primaryBase6
                          : AppColors.tertiary6,
                      child: SvgPicture.asset(
                        'assets/svgs/send-comment.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
