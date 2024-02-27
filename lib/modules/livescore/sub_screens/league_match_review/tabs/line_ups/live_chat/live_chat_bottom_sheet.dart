import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/viewmodel/live_chat_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/main_comment_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/more_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/share_bottom_sheet.dart';

import '../../../../../../../core/theme/colors.dart';
import 'components/chat_details.dart';
import 'components/like_button.dart';
import 'components/notification_container.dart';

class LiveChatBottomSheet extends StatelessWidget {
  const LiveChatBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 24.h,
                  ),
                  child: MainComments(),
                ),
              ),
            ),
            ChatBar(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();

    isLiked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveChatViewmodel>(
      builder: (context, model, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: ChatDetails(
                      photos:
                          model.getFirstThreeProfileImages().reversed.toList(),
                      comments: model.getTotalCommentCount(),
                      likes: 40,
                      shares: 200,
                    ),
                  ),
                  LikeButton(
                    isLiked: isLiked,
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                ],
              ),
            ),
            const NotificationContainer(),
          ],
        );
      },
    );
  }
}

class MainComments extends StatelessWidget {
  const MainComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveChatViewmodel>(
      builder: (context, model, child) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: model.comments.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MainCommentTile(
              comment: model.comments[index],
              onLikePressed: () {
                model.toggleCommentLike(comment: model.comments[index]);
                // model.comments[index].isLiked = !model.comments[index].isLiked!;
              },
              onCommentPressed: () {
                log('COMMENT');
                model.updateCurrentMessage(
                  isReply: true,
                  replyUsername: model.comments[index].username,
                  replyComments: model.comments[index].replyComments,
                );

                // Focus the TextField
                FocusScope.of(context).requestFocus(model.textFieldFocusNode);
              },
              onSharePressed: () {
                log('SHARE');
                onSharePressed(
                  context: context,
                  onCopyPressed: () {
                    log('COPY');
                  },
                  onSharePressed: () {
                    log('SHARE');
                  },
                );
              },
              onMorePressed: () {
                log('MORE');
                onMorePressed(
                  context: context,
                  onMutePressed: () {
                    log('MUTE');
                  },
                  onHidePressed: () {
                    log('HIDE');
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  /* onSharePressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => ShareBottomSheet(
          onCopyPressed: () {
            log('COPY');
          },
          onSharePressed: () {
            log('SHARE');
          },
        ),
      ),
    );
  }

  onMorePressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => MoreBottomSheet(
          onMutePressed: () {
            log('MUTE');
          },
          onHidePressed: () {
            log('HIDE');
          },
        ),
      ),
    );
  }*/
}

class ChatBar extends HookWidget {
  const ChatBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    late FocusNode focusNode;

    final model = Provider.of<LiveChatViewmodel>(context, listen: false);

    model.textFieldFocusNode = useFocusNode();
    focusNode = model.textFieldFocusNode;

    useEffect(() {
      focusNodeListener() {
        if (focusNode.hasFocus) {
          Future.microtask(() {
            SystemChannels.textInput.invokeMethod('TextInput.show');
          });
        }

        if (model.currentMessage.isReply) {
          if (!focusNode.hasFocus && textController.text.isEmpty) {
            model.resetCurrentMessage();
          }
        }
      }

      focusNode.addListener(focusNodeListener);

      return () {
        focusNode.removeListener(focusNodeListener);
      };
    }, []);

    return Consumer<LiveChatViewmodel>(
      builder: (context, model, child) {
        String hintText = 'Add comment';

        if (!model.currentMessage.isReply) {
          /////
          log('MAIN COMMENT');
        } else {
          log('REPLYING ---> ${model.currentMessage.replyUsername}');
          hintText = 'Replying to ${model.currentMessage.replyUsername}';
          ////
        }

        return Container(
          color: AppColors.primary7,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              model.currentMessage.attachedPhoto != null
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
                                model.currentMessage.attachedPhoto!,
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
                        focusNode: focusNode,
                        controller: textController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            // Process the submitted comment
                            log('Sending a message: $value');

                            model.sendMessage();
                            textController.clear();
                            focusNode.unfocus();

                            //model.message = '';
                            //model.updateCurrentMessage(message: '');
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
                          //model.message = value;
                          model.updateCurrentMessage(message: value);
                          // model.notifyListeners();
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          hintText: hintText,
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
                    onTap: model.message.isNotEmpty
                        ? () {
                            log('Sending a message');

                            model.sendMessage();
                            textController.clear();
                            focusNode.unfocus();

                            //model.message = '';
                            //model.updateCurrentMessage(message: '');
                            model.resetCurrentMessage();
                          }
                        : null,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: model.message.isNotEmpty
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
