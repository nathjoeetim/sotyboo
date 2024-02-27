import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/hide_replies_container.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/model/comment.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/comment_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/reply_comments.dart';

class MainCommentTile extends StatefulWidget {
  const MainCommentTile({
    Key? key,
    required this.comment,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.onMorePressed,
  }) : super(key: key);

  final Comment comment;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback onMorePressed;

  @override
  State<MainCommentTile> createState() => _MainCommentTileState();
}

class _MainCommentTileState extends State<MainCommentTile> {
  late bool showReplies;

  @override
  void initState() {
    super.initState();
    showReplies = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommentTile(
          comment: widget.comment,
          onLikePressed: widget.onLikePressed,
          onCommentPressed: widget.onCommentPressed,
          onSharePressed: widget.onSharePressed,
          onMorePressed: widget.onMorePressed,
          onShowRepliesPressed: () {
            setState(() {
              showReplies = true;
            });
          },
        ),
        if (showReplies)
          ReplyComments(
            replyComments: widget.comment.replyComments,
          ),
        if (showReplies)
          HideRepliesContainer(
            onPressed: () {
              setState(() {
                showReplies = false;
              });
            },
          ),
      ],
    );
  }
}
