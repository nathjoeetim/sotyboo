import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/colors.dart';
import '../../../components/selectable_text_container.dart';
import '../../club_info/tabs/matches/components/match_leagues.dart';
import '../viewmodel/favourite_viewmodel.dart';

class Matches extends StatelessWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TabsContainer(),
          MatchLeagues(),
        ],
      ),
    );
  }
}

class TabsContainer extends StatelessWidget {
  const TabsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 12.h,
        left: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary2,
        border: Border(
          bottom: BorderSide(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
        ),
      ),
      child: Consumer<FavouriteViewmodel>(
        builder: (context, model, child) {
          return SelectableTextContainer(
            texts: model.tabs.map((tab) => tab.name).toList(),
            selectedText: model.selectedTab.name,
            selectableType: SelectableType.favourite,
            onPressed: (value) {
              log('Value --->  $value');
              model.setSelectedTab(matchesTabName: value);
            },
          );
        },
      ),
    );
  }
}
