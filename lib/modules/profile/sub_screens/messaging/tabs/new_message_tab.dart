import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/messeges_model/inbox_model.dart';
import 'package:sportboo_mobile_client/modules/messeges_model/send_message_model.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button_outlined.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class NewMessageTab extends StatefulWidget {
  const NewMessageTab({Key? key}) : super(key: key);

  @override
  _NewMessageTabState createState() => _NewMessageTabState();
}

class _NewMessageTabState extends State<NewMessageTab> {
  final messageController = TextEditingController();
  final subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'New Message',
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.h),
            SubjectBox(subjectController: subjectController),
            SizedBox(height: 16.h),
            MessageBox(messageController: messageController),
            SizedBox(height: 24.h),
            SendButton(
              messageController: messageController,
              subjectController: subjectController,
            ),
            SizedBox(height: 16.h),
            const SaveButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class SubjectBox extends HookWidget {
  final TextEditingController subjectController;

  const SubjectBox({Key? key, required this.subjectController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: subjectController,
          labelText: 'Subject',
          hintText: '',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class MessageBox extends HookWidget {
  final TextEditingController messageController;

  const MessageBox({Key? key, required this.messageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Message',
            textScaleFactor: 1,
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
            controller: messageController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.send,
          ),
        ],
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final TextEditingController messageController;
  final TextEditingController subjectController;

  const SendButton({
    Key? key,
    required this.messageController,
    required this.subjectController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButton(
          text: 'Send',
          onPressed: () async {
            String message = messageController.text; // the message
            String subject = subjectController.text; // subject of the message
            bool messageSent = await onSendNewMessage(subject, message);
            if (messageSent) {
              getAllMessagesFn();
              // display popup success message
              showSportbooSnackBar('Message Sent', (id) => {});
              // Clear input fields after sending message
              messageController.clear();
              subjectController.clear();
            } else {
              // display popup error message
              showSportbooSnackBar('Unable to send Message!Try again', (id) => {});
            }
          },
        );
      },
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingViewmodel>(
      builder: (BuildContext context, model, Widget? child) {
        return WideButtonOutlined(
          text: 'Save to draft',
          onPressed: () {},
        );
      },
    );
  }
}
