import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/star.dart';

import '../../../components/avatar.dart';
import '../../../core/theme/colors.dart';

class PlayerTile extends StatefulWidget {
  PlayerTile({
    Key? key,
    required this.logo,
    required this.title,
    required this.subtitle,
    this.isFavourite = false,
    required this.onPressed,
    required this.onFavouritePressed,
  }) : super(key: key);

  final String logo;
  final String title;
  final String subtitle;
  bool isFavourite;
  final VoidCallback onPressed;
  final VoidCallback onFavouritePressed;
  @override
  State<PlayerTile> createState() => _PlayerTileState();
}

class _PlayerTileState extends State<PlayerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.tertiary1,
        boxShadow: [
          BoxShadow(
            color: AppColors.tertiaryBase10.withOpacity(0.08),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          const Avatar(
            radius: 16,
            avatarType: AvatarType.thin,
          ),
          SizedBox(width: 8.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: AppColors.tertiary9,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.h),
              Text(
                widget.subtitle,
                style: TextStyle(
                  color: AppColors.tertiary7,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          Star(
            isFavourite: widget.isFavourite,
            height: 20.h,
            //onPressed: widget.onFavouritePressed,
            onPressed: () {
              setState(() {
                widget.isFavourite = !widget.isFavourite;
              });
            },
          ),
        ],
      ),
    );
  }
}
