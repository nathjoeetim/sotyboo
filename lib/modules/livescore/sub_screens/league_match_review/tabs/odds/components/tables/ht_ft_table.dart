import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/odd_text.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/table_header_text.dart';

import '../../../../../../../../core/theme/colors.dart';

class HTFTTable extends StatelessWidget {
  const HTFTTable({
    super.key,
    required this.data,
    required this.odd,
    required this.o,
  });

  final List data;
  final String odd, o;

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
              0: FlexColumnWidth(5),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  color: AppColors.tertiary2,
                ),
                children: [
                  TableHeaderTextTwo(
                    text: odd,
                    isCentered: false,
                  ),
                  TableHeaderText(
                    text: o,
                  ),
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
                    // For 'o' column
                    OddTwo(data: data[i]['value1']),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
