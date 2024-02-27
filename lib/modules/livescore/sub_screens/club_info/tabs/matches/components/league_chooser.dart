import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';
import 'league_chooser_dialog.dart';

class LeagueChooser extends StatelessWidget {
  const LeagueChooser({
    Key? key,
    required this.leagueItems,
    required this.selectedLeague,
    required this.onPressed,
  }) : super(key: key);

  final List<Map<String, dynamic>> leagueItems;
  final Map<String, dynamic> selectedLeague;
  final ValueChanged<Map<String, dynamic>> onPressed;

  @override
  Widget build(BuildContext context) {
    log('SELECTED ---> ${selectedLeague['option']}');

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return LeagueChooserDialog(
              leagueItems: leagueItems,
              onPressed: onPressed,
            );
          },
        );
      },
      child: Container(
        color: AppColors.tertiary2,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: selectedLeague['icon'],
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.tertiaryBase10,
                  ),
                ],
              ),
              SizedBox(width: 11.33.w),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  selectedLeague['option'],
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
      ),
    );
  }
}

/*
class LeagueChooser extends StatelessWidget {
  const LeagueChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            // return const RequestPromptDialog();
            return const LeagueChooserDialog();
            // return TokenDialog();
          },
        );
      },
      child: Consumer<LeagueChooserViewmodel>(
        builder: (context, model, child) {
          return Container(
            color: AppColors.tertiary2,
            //height: 48.h,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20.h,
                        child: model.selectedLeague['icon'],
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.tertiaryBase10,
                      ),
                    ],
                  ),
                  SizedBox(width: 11.33.w),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      model.selectedLeague['option'],
                      //'All Competition',
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
          );
        },
      ),
    );
  }
}
*/
