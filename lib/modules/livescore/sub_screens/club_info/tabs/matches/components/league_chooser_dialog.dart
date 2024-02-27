import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

class LeagueChooserDialog extends StatefulWidget {
  final List<Map<String, dynamic>> leagueItems;
  final ValueChanged<Map<String, dynamic>> onPressed;

  const LeagueChooserDialog({
    Key? key,
    required this.leagueItems,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LeagueChooserDialog> createState() => _LeagueChooserDialogState();
}

class _LeagueChooserDialogState extends State<LeagueChooserDialog> {
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
        leagueItems: widget.leagueItems,
        onPressed: widget.onPressed,
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final List<Map<String, dynamic>> leagueItems;
  final ValueChanged<Map<String, dynamic>> onPressed;

  const CustomDialog({
    Key? key,
    required this.leagueItems,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 113.w),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.tertiary1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: leagueItems.length,
            itemBuilder: (BuildContext context, int index) {
              final leagueItem = leagueItems[index];

              return InkWell(
                onTap: () {
                  onPressed(leagueItem);
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
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 28.w,
                            child: leagueItem['icon'],
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Text(
                              leagueItem['option'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: AppColors.tertiary9,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index != leagueItems.length - 1)
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

/*
class LeagueChooserDialog extends StatefulWidget {
  const LeagueChooserDialog({Key? key}) : super(key: key);

  @override
  State<LeagueChooserDialog> createState() => _LeagueChooserDialogState();
}

class _LeagueChooserDialogState extends State<LeagueChooserDialog> {
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
      child: CustomDialog(),
    );
  }
}

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 113.w,
      ),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.tertiary1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          child: Consumer<LeagueChooserViewmodel>(
            builder: (context, model, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount:
                    model.leaguesCount, // Replace with the actual item count
                itemBuilder: (BuildContext context, int index) {
                  // Replace the return statement with your custom list item widget
                  return InkWell(
                    onTap: () {
                      model.setSelectedLeague(index: index);
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
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20.h,
                                width: 28.w,
                                child: model.leagueItems[index]['icon'],
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Text(
                                  model.leagueItems[index]['option'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: AppColors.tertiary9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (model.leagueItems[index] != model.leagueItems.last)
                          Divider(
                            thickness: 1.h,
                            color: AppColors.tertiary3,
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
*/
