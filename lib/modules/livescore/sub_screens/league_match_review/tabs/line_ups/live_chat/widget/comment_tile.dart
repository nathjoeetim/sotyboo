import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';
import '../components/chat_details.dart';
import '../components/comment_button.dart';
import '../components/like_button.dart';
import '../components/share_button.dart';
import '../model/comment.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    this.isReply = false,
    required this.comment,
    // required this.username,
    // this.profilePhoto,
    // required this.time,
    // this.message,
    // this.attachedPhoto,
    // this.commentsPhotos,
    // this.comments,
    // this.likes,
    // this.shares,
    // required this.isLiked,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.onMorePressed,
    this.onShowRepliesPressed,
  }) : super(key: key);

  final bool isReply;

  final Comment comment;
  // final String username;
  // final String? profilePhoto;
  // final String time;
  // final String? message;
  // final String? attachedPhoto;
  //
  // final List<String>? commentsPhotos;
  // final int? comments;
  // final int? likes;
  // final int? shares;
  //
  // final bool isLiked;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback onMorePressed;
  final VoidCallback? onShowRepliesPressed;

  @override
  Widget build(BuildContext context) {
    final commentsPhotos =
        comment.getFirstThreeReplyProfilePhotos()!.reversed.toList();

    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Photo
          CircleAvatar(
            radius: isReply ? 14.r : 16.r,
            backgroundColor: AppColors.tertiary3,
            child: comment.profilePhoto != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(isReply ? 13.r : 15.r),
                    child: Image.asset(
                      'assets/images/${comment.profilePhoto}',
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
          ),
          SizedBox(width: 8.h),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name
                    Text(
                      comment.username ?? 'Anonymous',
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: AppColors.primaryBase6,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Time
                        Text(
                          comment.time ?? '',
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: AppColors.tertiary6,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: onMorePressed,
                          child: SvgPicture.asset(
                            'assets/svgs/elipsis.svg',
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Comment
                if (comment.message != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        comment.message ?? '',
                        style: TextStyle(
                          color: AppColors.tertiary8,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                // Attached Photo
                if (comment.attachedPhoto != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8.h),
                      Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        //alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/${comment.attachedPhoto}',
                          //fit: BoxFit.scaleDown,
                        ),
                      )
                    ],
                  ),
                SizedBox(height: 12.h),
                //Reactions
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LikeButton(
                      isLiked: comment.isLiked ?? false,
                      onPressed: onLikePressed,
                    ),
                    SizedBox(width: 16.w),
                    CommentButton(
                      onPressed: onCommentPressed,
                    ),
                    SizedBox(width: 16.w),
                    ShareButton(
                      onPressed: onSharePressed,
                    ),
                  ],
                ),
                //Main Comments details
                if (!isReply &&
                    (commentsPhotos != null ||
                        (comment.replyComments != null &&
                            comment.replyComments!.isNotEmpty) ||
                        (comment.likes != null && comment.likes != 0) ||
                        (comment.shares != null && comment.shares != 0)))
                  GestureDetector(
                    onTap: comment.replyComments != null
                        ? onShowRepliesPressed
                        : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        ChatDetails(
                          photos: commentsPhotos,
                          //comments: comment.replyComments!.length,
                          comments: comment.replyComments != null
                              ? comment.replyComments!.length
                              : null,
                          likes: comment.likes,
                          shares: comment.shares,
                          commentIsReply: true,
                        ),
                      ],
                    ),
                  ),
                // Reply comment details
                if (isReply &&
                    ((comment.likes != null && comment.likes != 0) ||
                        (comment.shares != null && comment.shares != 0)))
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12.h),
                      ChatDetails(
                        likes: comment.likes,
                        shares: comment.shares,
                      ),
                    ],
                  ),
                //Reactions and buttons
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Reactions
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Reactions(),
                        if (!isReply)
                          Message(
                            numbers: 7,
                            onPressed: () {
                              ///////
                            },
                          ),
                        SizedBox(width: 4.w),
                        // Add Reactions
                        GestureDetector(
                          onTap: () {
                            log('React');
                          },
                          child: Image.asset(
                            'assets/images/add-reaction.png',
                            height: 16.h,
                            width: 16.h,
                          ),
                        ),
                      ],
                    ),
                    // Buttons
                    Visibility(
                      visible: !isReply,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              log('Add');
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/add.svg',
                              height: 16.h,
                              width: 16.w,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () {
                              log('More');
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/elipsis.svg',
                              height: 16.h,
                              width: 16.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }

/*  Widget _hideReplyContainer() => Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 40.w,
              child: const Divider(
                thickness: 1,
                color: AppColors.tertiary3,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              child: Text(
                'Hide replies',
                style: TextStyle(
                  color: AppColors.tertiary6,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );*/
}
