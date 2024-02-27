import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/matches/viewmodels/match_viewmodel.dart';

import '../../../core/theme/colors.dart';

class ItemChooserDialog extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onPressed;

  const ItemChooserDialog({
    Key? key,
    required this.items,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ItemChooserDialog> createState() => _ItemChooserDialogState();
}

class _ItemChooserDialogState extends State<ItemChooserDialog> {
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
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      opacity: _showDialog ? 1 : 0,
      child: CustomDialog(
        items: widget.items,
        onPressed: widget.onPressed,
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onPressed;

  const CustomDialog({
    Key? key,
    required this.items,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60.w, right: 60.w),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.tertiary1,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return InkWell(
                onTap: () {
                  onPressed(item);
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 2.h,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.tertiary9,
                        ),
                      ),
                    ),
                    if (index != items.length - 1)
                      Divider(
                        thickness: 1.h,
                        color: AppColors.tertiary3,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
