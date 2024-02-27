import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/odd_text.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/table_header_text.dart';

import '../../../../../../../../core/theme/colors.dart';

class OddsTable1X2 extends StatelessWidget {
  final List data;
  const OddsTable1X2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.tertiary1,
      ),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  color: AppColors.tertiary2,
                ),
                children: [
                  TableHeaderText(text: ''),
                  TableHeaderText(text: '1'),
                  TableHeaderText(text: 'X'),
                  TableHeaderText(text: '2'),
                ],
              ),
              for (int i = 0; i < data.length; i++)
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.tertiary2,
                        width: 1.h,
                      ),
                    ),
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 9.5.h,
                          horizontal: 16.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            data[i]['company'],
                            //height: 26.h,
                            width: 80.w,
                          ),
                        ),
                      ),
                    ),
                    Odd(data: data[i]['1']),
                    Odd(data: data[i]['x']),
                    Odd(data: data[i]['2']),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class OddsTableHomeAway extends StatelessWidget {
  final List data;
  const OddsTableHomeAway({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.tertiary1,
      ),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(4),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  color: AppColors.tertiary2,
                ),
                children: [
                  TableHeaderText(text: ''),
                  TableHeaderText(text: '1'),
                  TableHeaderText(text: '2'),
                ],
              ),
              for (int i = 0; i < data.length; i++)
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
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 9.5.h,
                          horizontal: 16.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            data[i]['company'],
                            width: 80.w,
                          ),
                        ),
                      ),
                    ),
                    Odd(data: data[i]['1']),
                    Odd(data: data[i]['2']),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
