import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/components/knot.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/button_bottom_sheet_tile.dart';

onMorePressed({
  required BuildContext context,
  required VoidCallback onMutePressed,
  required VoidCallback onHidePressed,
}) {
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
        onMutePressed: onMutePressed,
        onHidePressed: onHidePressed,
      ),
    ),
  );
}

class MoreBottomSheet extends StatelessWidget {
  const MoreBottomSheet({
    Key? key,
    required this.onMutePressed,
    required this.onHidePressed,
  }) : super(key: key);

  final VoidCallback onMutePressed;
  final VoidCallback onHidePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Knot(),
          SizedBox(height: 8.h),
          ButtonBottomSheetTile(
            label: 'Mute',
            icon: 'mute',
            onPressed: onMutePressed,
          ),
          SizedBox(height: 8.h),
          ButtonBottomSheetTile(
            label: 'Hide',
            icon: 'hide',
            onPressed: onHidePressed,
          ),
          SizedBox(height: 21.h),
        ],
      ),
    );
  }
}
