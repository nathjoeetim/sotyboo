import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/my_expansion_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/overview/widgets/missing_player_info_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/overview/widgets/player_info_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/viewmodel/lineup_viewmodel.dart';

import '../../../../../../../core/theme/colors.dart';

class LineupOverview extends StatelessWidget {
  const LineupOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        StartingLineups(),
        Substitutes(),
        MissingPlayers(),
        Coaches(),
      ],
    );
  }
}

class StartingLineups extends StatelessWidget {
  const StartingLineups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      title: 'Starting Lineups',
      children: [
        Consumer<LineupViewmodel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.tertiary1,
                border: Border(
                  top: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        model.firstTeamPlayers.length,
                        (index) {
                          return PlayerInfoTile(
                            player: model.firstTeamPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  //Away Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        model.secondTeamPlayers.length,
                        (index) {
                          return PlayerInfoTile(
                            isAway: true,
                            player: model.secondTeamPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Substitutes extends StatelessWidget {
  const Substitutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      title: 'Substitutes',
      children: [
        Consumer<LineupViewmodel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.tertiary1,
                border: Border(
                  top: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        model.firstTeamPlayers.length,
                        (index) {
                          return PlayerInfoTile(
                            player: model.firstTeamPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  //Away Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        model.secondTeamPlayers.length,
                        (index) {
                          return PlayerInfoTile(
                            isAway: true,
                            player: model.secondTeamPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class MissingPlayers extends StatelessWidget {
  const MissingPlayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      title: 'Missing Players',
      children: [
        Consumer<LineupViewmodel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.tertiary1,
                border: Border(
                  top: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        model.firstTeamMissingPlayers.length,
                        (index) {
                          return MissingPlayerInfoTile(
                            player: model.firstTeamMissingPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  //Away Team
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        model.secondTeamMissingPlayers.length,
                        (index) {
                          return MissingPlayerInfoTile(
                            isAway: true,
                            player: model.secondTeamMissingPlayers[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Coaches extends StatelessWidget {
  const Coaches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      title: 'Coaches',
      children: [
        Consumer<LineupViewmodel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.tertiary1,
                border: Border(
                  top: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home Team
                  PlayerInfoTile(
                    player: model.firstTeamCoach,
                  ),
                  SizedBox(width: 16.w),
                  //Away Team
                  PlayerInfoTile(
                    isAway: true,
                    player: model.secondTeamCoach,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
