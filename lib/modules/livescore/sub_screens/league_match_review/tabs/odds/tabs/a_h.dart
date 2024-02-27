import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/tables/o_u_table.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/game_responsibly_text.dart';

import '../../../../../../../core/theme/colors.dart';
import '../style/odd_style.dart';

class AH extends StatefulWidget {
  const AH({Key? key}) : super(key: key);

  @override
  State<AH> createState() => _AHState();
}

class _AHState extends State<AH> with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  final List<Map<String, dynamic>> handicap35 = [
    {
      'company': 'assets/images/1xbet.png',
      'value1': {
        'value': 1.79,
        'arrow': '',
        'isOut': false,
      },
      'value2': {
        'value': 4.16,
        'arrow': '',
        'isOut': false,
      },
    },
  ];

  final List<Map<String, dynamic>> handicap3 = [
    {
      'company': 'assets/images/1xbet.png',
      'value1': {
        'value': 1.79,
        'arrow': '',
        'isOut': true,
      },
      'value2': {
        'value': 4.16,
        'arrow': '',
        'isOut': true,
      },
    },
  ];

  final List<Map<String, dynamic>> handicap275 = [
    {
      'company': 'assets/images/1xbet.png',
      'value1': {
        'value': 1.79,
        'arrow': 'down',
        'isOut': false,
      },
      'value2': {
        'value': 4.16,
        'arrow': 'down',
        'isOut': false,
      },
    },
  ];

  final List<Map<String, dynamic>> handicap25 = [
    {
      'company': 'assets/images/1xbet.png',
      'value1': {
        'value': 1.79,
        'arrow': 'down',
        'isOut': false,
      },
      'value2': {
        'value': 4.16,
        'arrow': 'down',
        'isOut': false,
      },
    },
  ];

  final List<Map<String, dynamic>> handicap225 = [
    {
      'company': 'assets/images/1xbet.png',
      'value1': {
        'value': 1.79,
        'arrow': 'down',
        'isOut': false,
      },
      'value2': {
        'value': 4.16,
        'arrow': 'down',
        'isOut': false,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time tab bar
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: 4.h,
            bottom: 6.h,
            left: 16.w,
          ),
          color: AppColors.tertiary2,
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            onTap: (int i) {
              setState(() {
                index = i;
              });
              print(index);
            },
            tabs: [
              Container(
                  padding: EdgeInsets.all(8.h),
                  margin: EdgeInsets.only(right: 16.w),
                  decoration:
                      index == 0 ? _decoration() : const BoxDecoration(),
                  child: Text(
                    'FULL TIME',
                    style: textStyle(0, index),
                  )),
              // tabController.

              Container(
                padding: EdgeInsets.all(8.h),
                margin: EdgeInsets.only(right: 16.w),
                decoration: index == 1 ? _decoration() : const BoxDecoration(),
                child: Text(
                  '1ST HALF',
                  style: textStyle(1, index),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.h),
                margin: EdgeInsets.only(right: 16.w),
                decoration: index == 2 ? _decoration() : const BoxDecoration(),
                child: Text(
                  '2ND HALF',
                  style: textStyle(2, index),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 2.h,
          color: AppColors.tertiary1,
        ),
        OUTable(
          data: handicap35,
          o: '1',
          u: '2',
          odd: 'HANDICAP: -3.5',
        ),
        OUTable(
          data: handicap3,
          o: '1',
          u: '2',
          odd: 'HANDICAP: -3',
        ),
        OUTable(
          data: handicap275,
          o: '1',
          u: '2',
          odd: 'HANDICAP: -2.75',
        ),
        OUTable(
          data: handicap25,
          o: '1',
          u: '2',
          odd: 'HANDICAP: -2.5',
        ),
        OUTable(
          data: handicap225,
          o: '1',
          u: '2',
          odd: 'HANDICAP: -2.25',
        ),
        const GameResponsiblyText(),
      ],
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.tertiary1,
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiaryBase10.withOpacity(0.08),
              offset: Offset(0, 2.h),
              blurRadius: 8.r,
            ),
          ]);
}
