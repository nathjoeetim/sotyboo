import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/matches/viewmodels/match_viewmodel.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../components/selectable_text_container.dart';
import 'components/league_chooser.dart';
import 'components/match_leagues.dart';

class MatchesTab extends StatelessWidget {
  const MatchesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MatchViewmodel>(context, listen: false).initialize();

    return SingleChildScrollView(
      child: Column(
        children: const [
          LeagueChooserContainer(),
          TabsContainer(),
          MatchLeagues()
        ],
      ),
    );
  }
}

class LeagueChooserContainer extends StatelessWidget {
  const LeagueChooserContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchViewmodel>(
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.tertiary2,
            border: Border(
              bottom: BorderSide(
                width: 2.h,
                color: AppColors.tertiary1,
              ),
            ),
          ),
          //child: const LeagueDropdownMenu(),
          child: LeagueChooser(
            leagueItems: model.leagueItems,
            selectedLeague: model.selectedLeague,
            onPressed: (selectedLeague) {
              log('Selected league: ${selectedLeague['option']}');

              model.setSelectedLeague(selectedLeague: selectedLeague);
            },
          ),
        );
      },
    );
  }
}

class TabsContainer extends StatelessWidget {
  const TabsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
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
      child: Consumer<MatchViewmodel>(
        builder: (context, model, child) {
          return SelectableTextContainer(
            /*texts: [
              model.tab[0].name,
              model.tab[1].name,
            ],*/
            texts: model.tabs.map((tab) => tab.name).toList(),
            selectedText: model.selectedTab.name,
            selectableType: SelectableType.standardGreenText,
            onPressed: (value) {
              log('Value --->  $value');

              model.setSelectedTab(matchesTabName: value);
/*
              if (value == model.tileType[0].name) {
                log('Fixtures');
              } else {
                log('Results');
              }*/
            },
          );
        },
      ),
    );
  }
}
