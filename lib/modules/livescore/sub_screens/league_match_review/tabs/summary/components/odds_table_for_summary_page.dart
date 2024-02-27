import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/odd_text.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/table_header_text.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/table_section_header_text.dart';

import '../../../../../../../core/theme/colors.dart';

class OddsTable1X2ForSummaryPage extends StatelessWidget {
  final List data;
  const OddsTable1X2ForSummaryPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(2.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
          },
          children: const [
            TableRow(
              children: [
                TableSectionHeaderText(text: 'Odds'),
                TableHeaderText(text: '1'),
                TableHeaderText(text: 'X'),
                TableHeaderText(text: '2'),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.tertiary1,
            border: Border.all(color: AppColors.tertiary3),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2.5),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
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
        ),
      ],
    );
  }
}
