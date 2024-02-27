import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/components/knot.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/button_bottom_sheet_tile.dart';

onSharePressed({
  required BuildContext context,
  required VoidCallback onCopyPressed,
  required VoidCallback onSharePressed,
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
      builder: (context, scrollController) => ShareBottomSheet(
        onCopyPressed: onCopyPressed,
        onSharePressed: onSharePressed,
      ),
    ),
  );
}

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    Key? key,
    required this.onCopyPressed,
    required this.onSharePressed,
  }) : super(key: key);

  final VoidCallback onCopyPressed;
  final VoidCallback onSharePressed;

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
            label: 'Copy',
            icon: 'copy-2',
            onPressed: onCopyPressed,
          ),
          SizedBox(height: 8.h),
          ButtonBottomSheetTile(
            label: 'Share',
            icon: 'share-2',
            onPressed: onSharePressed,
          ),
          SizedBox(height: 21.h),
        ],
      ),
    );
  }
}
