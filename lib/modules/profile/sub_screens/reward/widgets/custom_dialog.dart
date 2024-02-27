import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/widgets/closer.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key? key}) : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  bool _showDialog = false;

  @override
  void initState() {
    super.initState();
    // Delay the showing of the dialog by 200 milliseconds
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _showDialog = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(
          0, _showDialog ? -320.h : -MediaQuery.of(context).size.height, 0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: const CustomDialog(),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryTint9,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.r,
                offset: const Offset(0, 0),
                color: AppColors.tertiaryBase10.withOpacity(0.08),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //height: double.maxFinite,
                margin: EdgeInsets.all(2.h),
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: AppColors.tertiary1,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset(
                  getImage('yellow-coin'),
                  height: 52.h,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  'You have redeemed 500 SPB Token successfully',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.tertiary1,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                margin: EdgeInsets.only(right: 16.w),
                child: const Closer(),
              ),
            ],
          )),
    );
  }
}
