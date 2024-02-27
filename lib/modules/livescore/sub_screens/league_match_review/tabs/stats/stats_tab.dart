import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/selectable_text_container.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/components/stat_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/viewmodel/stats_viewmodel.dart';

import '../../../../../../core/theme/colors.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TabBarContainer(),
            const BodyContainer(),
          ],
        ),
      ),
    );
  }
}

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: const BoxDecoration(
        color: AppColors.tertiary2,
      ),
      child: Consumer<StatsViewmodel>(
        builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SelectableTextContainer(
              texts: model.tabs.map((tab) => tab.value).toList(),
              selectedText: model.selectedTab.value,
              selectableType: SelectableType.standardGreenText,
              onPressed: (value) {
                log('Value --->  $value');

                model.setSelectedTab(statsTabName: value);
              },
            ),
          );
        },
      ),
    );
  }
}

/*
class BodyContainer extends StatelessWidget {
  const BodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsViewmodel>(
      builder: (context, model, child) {
        late Widget bodyWidget;

        switch (model.selectedTab) {
          case SearchTab.all:
            bodyWidget = const All();
            break;
          case SearchTab.competitions:
            bodyWidget = const Competitions();
            break;
          case SearchTab.teams:
            bodyWidget = const Teams();
            break;
          case SearchTab.players:
            bodyWidget = const Players();
            break;
          default:
            bodyWidget = const All();
        }

        return Expanded(
          child: Container(
            color: AppColors.tertiary2,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: bodyWidget,
              ),
            ),
          ),
        );
      },
    );
  }
}*/

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        top: 8.h,
        bottom: 19.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border.all(color: AppColors.tertiary3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ...List.generate(
            5,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  border: index < 5 - 1
                      ? Border(
                          bottom: BorderSide(
                            width: 1.h,
                            color: AppColors.tertiary3,
                          ),
                        )
                      : const Border(),
                ),
                child: const StatTile(
                  title: 'Possession (%)',
                  homeTeamWinCount: 60,
                  awayTeamWinCount: 40,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
