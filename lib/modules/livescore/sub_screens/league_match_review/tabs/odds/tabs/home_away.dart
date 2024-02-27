import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/tables/odds_table.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/texts/game_responsibly_text.dart';

import '../../../../../../../core/theme/colors.dart';
import '../style/odd_style.dart';

class HomeAway extends StatefulWidget {
  const HomeAway({super.key});

  @override
  State<HomeAway> createState() => _HomeAwayState();
}

class _HomeAwayState extends State<HomeAway> with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        SizedBox(
          width: double.maxFinite,
          height: 400.h,
          child: TabBarView(controller: _tabController, children: [
            FullTime(),
            FirstHalf(),
            SecondHalf(),
          ]),
        )
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

class FullTime extends StatelessWidget {
  FullTime({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'company': 'assets/images/bet9ja.png',
      '1': {
        'value': 1.79,
        'isDown': false,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OddsTableHomeAway(data: data),
        const GameResponsiblyText(),
      ],
    );
  }
}

class FirstHalf extends StatelessWidget {
  FirstHalf({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'company': 'assets/images/bet9ja.png',
      '1': {
        'value': 1.79,
        'isDown': false,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OddsTableHomeAway(data: data),
        const GameResponsiblyText(),
      ],
    );
  }
}

class SecondHalf extends StatelessWidget {
  SecondHalf({super.key});
  final List<Map<String, dynamic>> data = [
    {
      'company': 'assets/images/bet9ja.png',
      '1': {
        'value': 1.79,
        'isDown': false,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OddsTableHomeAway(data: data),
        const GameResponsiblyText(),
      ],
    );
  }
}
