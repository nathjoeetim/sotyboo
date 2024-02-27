import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../core/theme/colors.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({
    Key? key,
    this.photos,
    this.comments,
    this.likes,
    this.shares,
    this.commentIsReply = false,
  }) : super(key: key);

  final List<String>? photos;
  final int? comments;
  final int? likes;
  final int? shares;
  final bool commentIsReply;

  @override
  Widget build(BuildContext context) {
    String commentText = 'comment';
    String likeText = 'like';
    String shareText = 'share';

    if (comments != null) {
      commentText = comments! > 1
          ? commentIsReply
              ? 'replies'
              : 'comments'
          : commentIsReply
              ? 'reply'
              : 'comment';
    }

    if (likes != null) {
      likeText = likes! > 1 ? 'likes' : 'like';
    }

    if (shares != null) {
      shareText = shares! > 1 ? 'shares' : 'share';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildImageStack(),
        ),
        if (comments != null && comments != 0)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8.w),
              _text('$comments $commentText'),
            ],
          ),
        if (likes != null && likes != 0)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (comments != null && comments != 0)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 4.w),
                    _dot(),
                    SizedBox(width: 4.w),
                  ],
                ),
              _text('$likes $likeText'),
            ],
          ),
        if (shares != null && shares != 0)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if ((comments != null && comments != 0) ||
                  (likes != null && likes != 0))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 4.w),
                    _dot(),
                    SizedBox(width: 4.w),
                  ],
                ),
              _text('$shares $shareText'),
            ],
          ),
      ],
    );
  }

  Widget _groupImage(String path) {
    return CircleAvatar(
      radius: 8.5.r,
      backgroundColor: AppColors.tertiary1,
      /*child: ClipRRect(
        borderRadius: BorderRadius.circular(2.5.r),
        child: Image.asset(
          'assets/images/$path',
          fit: BoxFit.cover,
        ),
      ),*/
      child: Container(
        height: 15.h,
        width: 15.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5.r),
          child: Image.asset(
            'assets/images/$path',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildImageStack() {
    final List<Widget> imageWidgets = [];

    if (photos != null && photos!.isNotEmpty) {
      // We can have a minimum of Zero images and a maximum of 3
      final int maxImages = photos!.length.clamp(0, 3);
      // Width of one image is 17
      double imageWidth = 17.w;

      // Total container width of two images
      if (maxImages == 2) {
        imageWidth += (17.w / 2);
      }
      // Total container width of 3 images
      else if (maxImages == 3) {
        imageWidth += 17.w;
      }

      // Loop through the images
      for (int i = 0; i < maxImages; i++) {
        final String path = photos![i];
        // For the first image, the right is 0, then add 8 to the right for subsequent images
        final double right = i.toDouble() * 8.5;
        // For the first image, the right is 16, then subtract 8 to the right for subsequent images
        final double left = (maxImages - i - 1).toDouble() * 8;

        imageWidgets.add(
          Positioned(
            top: 0,
            bottom: 0,
            right: right,
            left: left,
            child: _groupImage(path),
          ),
        );
      }

      return [
        SizedBox(
          width: imageWidth,
          height: 17.h,
          child: Stack(
            children: imageWidgets,
          ),
        ),
      ];
    }

    return imageWidgets;
  }

  Widget _text(String text) => Text(
        text,
        textScaleFactor: 1,
        style: TextStyle(
          color: AppColors.tertiary6,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _dot() => SvgPicture.asset(
        'assets/svgs/dot.svg',
        height: 2.h,
        width: 2.w,
      );
}
