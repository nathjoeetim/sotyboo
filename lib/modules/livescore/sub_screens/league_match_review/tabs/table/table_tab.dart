import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/league_table.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/tableHintTile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/table/components/selectable_table_text.dart';

import '../../../../../../core/theme/colors.dart';

class TableTab extends StatefulWidget {
  const TableTab({super.key});

  @override
  State<TableTab> createState() => _TableTabState();
}

class _TableTabState extends State<TableTab> with TickerProviderStateMixin {
  int index = 0;
  late TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            const SelectableTableText(),
            /* Container(
              padding: const EdgeInsets.only(top: 15),
              child: TabBar(
                isScrollable: true,
                controller: _controller,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,

                // splashFactory: InkSplash.       ,
                splashFactory: NoSplash.splashFactory,

                // dividerColor: Colors.transparent,
                onTap: (int i) {
                  setState(() {
                    index = i;
                  });
                  print(index);
                },
                tabs: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      decoration: index == 0 ? decoration() : decoration2(),
                      child: Text(
                        'OVERALL',
                        style: textStyle(0, index),
                      )),
                  // tabController.

                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: index == 1 ? decoration() : decoration2(),
                      child: Text('HOME', style: textStyle(1, index))),

                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: index == 2 ? decoration() : decoration2(),
                      child: Text(
                        'AWAY',
                        style: textStyle(2, index),
                      )),
                ],
              ),
            ),*/
            SizedBox(height: 16.h),
            LeagueTable(),
            SizedBox(height: 16.h),
            const TableHintTile(
              color: AppColors.info4,
              text: 'Promotion - Champions League ( Group State)',
            ),
            const TableHintTile(
              color: AppColors.danger4,
              text: 'Promotion - Europa League ( Group State)',
            ),
            const TableHintTile(
              color: AppColors.dangerBase3,
              text: 'Promotion - Championship',
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'If teams finish on equal points at the end of the season, score difference will be the tie-breaker.',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.tertiary8,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(val, index) => TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: index == val ? AppColors.tertiary1 : AppColors.tertiary8);

  BoxDecoration decoration() => BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryBase6,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEFEFEF),
              // spreadRadius: 5,
              offset: Offset(1, 2),
              blurRadius: 10,
            ),
          ]);
  BoxDecoration decoration2() => BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.tertiary3,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEFEFEF),
              // spreadRadius: 5,
              offset: Offset(1, 2),
              blurRadius: 10,
            ),
          ]);

  Widget hintRow({required Color color, required text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          _colorBox(color),
          const SizedBox(
            width: 14,
          ),
          Text(
            text,
            style: TextStyle(color: AppColors.tertiaryBase10, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }

  Widget _colorBox(Color color) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }
}
