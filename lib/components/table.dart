import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/colors.dart';
import 'avatar.dart';

class PremierLeagueTable extends StatelessWidget {
  final List<Map<String, dynamic>> teams = [
    {
      'team': 'Manchester City',
      'position': '1',
      'played': 34,
      'gd': 44,
      'pts': 80
    },
    {
      'team': 'Manchester United',
      'position': '5',
      'played': 33,
      'gd': 29,
      'pts': 67
    },
  ];

  PremierLeagueTable({
    super.key,
    required this.seeAllText,
    this.hasIcon = true,
  });

  final bool seeAllText;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.tertiary3,
        ),
      ),
      padding: seeAllText
          ? EdgeInsets.symmetric(vertical: 12.h)
          : EdgeInsets.only(top: 12.h),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/EN.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premier League',
                            style: TextStyle(
                              color: AppColors.tertiary9,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'England',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.tertiary7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svgs/arrow-right.svg',
                    color: AppColors.tertiary9,
                    height: 16.h,
                    width: 16.h,
                  ),
                ],
              )),
          Divider(
            thickness: 1.h,
            color: AppColors.tertiary3,
          ),
          // Table
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(4.5),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.tertiary3,
                      width: 1.h,
                    ),
                  ),
                ),
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        '#',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'Team',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'GD',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'PTS',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < teams.length; i++)
                TableRow(
                  decoration: i < teams.length - 1
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.tertiary3,
                              width: 1.h,
                            ),
                          ),
                        )
                      : null,
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          '${teams[i]['position']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.tertiary9,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: hasIcon,
                              child: Avatar(
                                radius: 8.r,
                                avatarType: AvatarType.thin,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                '${teams[i]['team']}',
                                style: TextStyle(
                                  color: AppColors.tertiary9,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          '${teams[i]['played']}',
                          style: TextStyle(
                            color: AppColors.tertiary9,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          '${teams[i]['gd']}',
                          style: TextStyle(
                            color: AppColors.tertiary9,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          '${teams[i]['pts']}',
                          style: TextStyle(
                            color: AppColors.tertiary9,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          seeAllText
              ? Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppColors.primaryBase6,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
