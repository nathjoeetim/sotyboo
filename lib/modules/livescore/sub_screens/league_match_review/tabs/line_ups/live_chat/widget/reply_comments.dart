import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/model/comment.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/viewmodel/live_chat_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/comment_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/more_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/share_bottom_sheet.dart';
import '../../../../../../../../core/theme/colors.dart';

class ReplyComments extends StatelessWidget {
  const ReplyComments({Key? key, required this.replyComments})
      : super(key: key);

  //final List<ReplyComment>? replyComments;
  final List<Comment>? replyComments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 40.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Divider(
            thickness: 1.h,
            color: AppColors.tertiary3,
          ),
          Consumer<LiveChatViewmodel>(
            builder: (context, model, child) {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: replyComments!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommentTile(
                    isReply: true,
                    comment: replyComments![index],
                    onLikePressed: () {
                      model.toggleCommentLike(comment: replyComments![index]);
                    },
                    onCommentPressed: () {
                      log('COMMENT');
                      model.updateCurrentMessage(
                        isReply: true,
                        replyUsername: replyComments![index].username,
                        replyComments: replyComments,
                      );

                      // Focus the TextField
                      FocusScope.of(context)
                          .requestFocus(model.textFieldFocusNode);
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
          ),
        ],
      ),
    );
  }
}
