import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class LeagueTable extends StatelessWidget {
  final List<Map<String, dynamic>> teams = [
    {
      'team': 'Manchester City',
      'played': 34,
      'gd': 44,
      'pts': 80,
      'color': 'blue'
    },
    {
      'team': 'Manchester United',
      'played': 33,
      'gd': 29,
      'pts': 67,
      'color': 'blue'
    },
    {
      'team': 'Leicester City',
      'played': 34,
      'gd': 20,
      'pts': 63,
      'color': 'blue'
    },
    {'team': 'Chelsea', 'played': 34, 'gd': 22, 'pts': 61, 'color': 'blue'},
    {
      'team': 'West Ham United',
      'played': 33,
      'gd': 10,
      'pts': 55,
      'color': 'red'
    },
    {'team': 'Liverpool', 'played': 33, 'gd': 16, 'pts': 54, 'color': 'none'},
    {'team': 'Fullham', 'played': 34, 'gd': 44, 'pts': 80, 'color': 'none'},
    {'team': 'Brentford', 'played': 33, 'gd': 29, 'pts': 67, 'color': 'none'},
    {'team': 'Everton', 'played': 34, 'gd': 20, 'pts': 63, 'color': 'none'},
    {'team': 'Leeds', 'played': 34, 'gd': 22, 'pts': 61, 'color': 'none'},
    {'team': 'Bournamouth', 'played': 33, 'gd': 10, 'pts': 55, 'color': 'none'},
    {
      'team': 'Aston Villa',
      'played': 33,
      'gd': 16,
      'pts': 54,
      'color': 'none',
    },
    {
      'team': 'Crystal Palace',
      'played': 34,
      'gd': 44,
      'pts': 80,
      'color': 'none'
    },
    {'team': 'Wolves', 'played': 33, 'gd': 29, 'pts': 67, 'color': 'none'},
    {
      'team': 'Southampton',
      'played': 34,
      'gd': 20,
      'pts': 63,
      'color': 'maroon'
    },
    {'team': 'Leicester', 'played': 34, 'gd': 22, 'pts': 61, 'color': 'maroon'},
    {'team': 'Brighton', 'played': 33, 'gd': 10, 'pts': 55, 'color': 'maroon'},
    {
      'team': 'Nottingham',
      'played': 33,
      'gd': 16,
      'pts': 54,
      'color': 'maroon'
    },
  ];

  LeagueTable({super.key});

  boxColor(color) {
    if (color == 'blue') {
      return AppColors.info4;
    } else if (color == 'maroon') {
      return AppColors.dangerBase3;
    } else if (color == 'red') {
      return AppColors.danger4;
    } else {
      return AppColors.tertiary1;
    }

    // return
  }

  textColor(color) {
    if (color == 'blue') {
      return AppColors.tertiary1;
    } else if (color == 'maroon') {
      return AppColors.tertiary1;
    } else if (color == 'red') {
      return AppColors.tertiary1;
    } else {
      return AppColors.tertiaryBase10;
    }

    // return
  }

  // Promotion promotion

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.h,
          color: AppColors.tertiary3,
        ),
      ),
      child: Column(
        children: [
          Table(
            columnWidths: {
              0: FixedColumnWidth(50.w),
              1: const FlexColumnWidth(3.9),
              2: const FlexColumnWidth(1),
              3: const FlexColumnWidth(1),
              4: const FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.tertiary3,
                      width: 1,
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
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
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
                        'TEAM',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
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
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
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
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
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
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
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
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.tertiary3,
                              width: 1,
                            ),
                          ),
                        )
                      : null,
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 8.w,
                          top: 7.h,
                          bottom: 7.h,
                        ),
                        child: Container(
                          height: 26.h,
                          width: 26.w,
                          //padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: boxColor(teams[i]['color']),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor(
                                teams[i]['color'],
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.tertiaryBase10,
                            child: CircleAvatar(
                              backgroundColor: AppColors.tertiaryTint4,
                              radius: 11.r,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              '${teams[i]['team']}',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.tertiary9,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        '${teams[i]['played']}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        '${teams[i]['gd']}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        '${teams[i]['pts']}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiary9,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

enum Promotion { blue, red, maroon, none }
