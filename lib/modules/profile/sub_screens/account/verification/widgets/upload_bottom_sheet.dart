import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../components/knot.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../unils/utils.dart';

onUploadPressed({
  required BuildContext context,
  required VoidCallback onPhotoLibraryPressed,
  required VoidCallback onCameraPressed,
  required VoidCallback onDocumentsPressed,
}) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        topRight: Radius.circular(32.r),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) => UploadBottomSheet(
        onPhotoLibraryPressed: onPhotoLibraryPressed,
        onCameraPressed: onCameraPressed,
        onDocumentsPressed: onDocumentsPressed,
      ),
    ),
  );
}

class UploadBottomSheet extends StatelessWidget {
  const UploadBottomSheet({
    Key? key,
    required this.onPhotoLibraryPressed,
    required this.onCameraPressed,
    required this.onDocumentsPressed,
  }) : super(key: key);

  final VoidCallback onPhotoLibraryPressed;
  final VoidCallback onCameraPressed;
  final VoidCallback onDocumentsPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Knot(isWide: true),
        _tile(
          context: context,
          icon: 'gallery-add2',
          text: 'Photo Library',
          onPressed: onPhotoLibraryPressed,
        ),
        _line(),
        _tile(
          context: context,
          icon: 'camera',
          text: 'Camera',
          onPressed: onCameraPressed,
        ),
        _line(),
        _tile(
          context: context,
          icon: 'document',
          text: 'Documents',
          onPressed: onDocumentsPressed,
        ),
        SizedBox(height: 21.h),
      ],
    );
  }

  Widget _line() => Divider(
        height: 0,
        thickness: 1.h,
        color: AppColors.tertiary3,
      );

  Widget _tile({
    required BuildContext context,
    required String icon,
    required String text,
    required VoidCallback onPressed,
  }) =>
      InkWell(
        onTap: () {
          onPressed();
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Row(
            children: [
              SvgPicture.asset(
                getSvg(icon),
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 16.w),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                getSvg('arrow-right'),
                height: 20.h,
                width: 20.w,
                color: AppColors.tertiaryBase10,
              ),
            ],
          ),
        ),
      );
}
