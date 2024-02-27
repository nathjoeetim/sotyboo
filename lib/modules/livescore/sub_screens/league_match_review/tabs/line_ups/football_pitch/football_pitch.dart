import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/football_pitch/widgets/player.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/football_pitch/widgets/rug.dart';

import '../../../../../../../core/theme/colors.dart';
import '../model/player_model.dart';
import '../viewmodel/lineup_viewmodel.dart';

class FootballPitch extends StatelessWidget {
  const FootballPitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      //height: 664.h,
      color: AppColors.pitch,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Consumer<LineupViewmodel>(
            builder: (context, model, child) {
              return Text(
                'MANCHESTER CITY   ${model.firstTeamFormation}',
                style: TextStyle(
                  color: AppColors.tertiary1,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          SizedBox(height: 6.h),
          SizedBox(
            height: 600.h,
            width: double.maxFinite,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: Rugs(),
                ),
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/svgs/football_pitch.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const FirstTeam(),
                const SecondTeam(),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Consumer<LineupViewmodel>(
            builder: (context, model, child) {
              return Text(
                'MANCHESTER UNITED   ${model.secondTeamFormation}',
                style: TextStyle(
                  color: AppColors.tertiary1,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class FirstTeam extends StatelessWidget {
  const FirstTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LineupViewmodel>(
      builder: (context, model, child) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 300.h,
          child: FormationWidget(
            formation: model.firstTeamFormation,
            isAway: false,
            players: model.firstTeamPlayers,
          ),
        );
      },
    );
  }
}

class SecondTeam extends StatelessWidget {
  const SecondTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LineupViewmodel>(
      builder: (context, model, child) {
        return Positioned(
          top: 300.h,
          left: 0,
          right: 0,
          bottom: 0,
          child: FormationWidget(
            formation: model.secondTeamFormation,
            isAway: true,
            players: model.secondTeamPlayers,
          ),
        );
      },
    );
  }
}

class FormationWidget extends StatelessWidget {
  const FormationWidget({
    Key? key,
    required this.formation,
    required this.isAway,
    required this.players,
  }) : super(key: key);

  final String formation;
  final bool isAway;
  final List<PlayerModel> players;

  @override
  Widget build(BuildContext context) {
    List<int> formationNumbers = formation
        .split('-')
        .map((number) => int.parse(number))
        .toList(growable: false);

    if (players.length != 11) {
      throw ArgumentError(
          'Mismatched player count. Expected 11 players, but got ${players.length} players.');
    }

    int playerIndex = 0;

    return Transform.rotate(
      angle: isAway ? pi : 0,
      child: Container(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Goalkeeper
            Player(
              isAway: isAway,
              player: players[playerIndex],
              /* playerName: 'Ederson',
              playerNumber: '9',
              goals: 3,
              booking: 'yellow-red',
              isSubstituted: true,
              isReceivingTreatment: true,*/
            ),
            SizedBox(height: formationNumbers.length == 4 ? 4.h : 15.h),
            // Other Players
            Column(
              children: List.generate(
                formationNumbers.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index < formationNumbers.length - 1
                          ? formationNumbers.length == 4
                              ? 4.h
                              : 15.h
                          : 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        formationNumbers[index],
                        (index) {
                          playerIndex = playerIndex + 1;
                          return Player(
                            isAway: isAway,
                            player: players[playerIndex],
                            /* playerName: 'Ederson',
                          playerNumber: '9',
                          goals: 3,
                          booking: 'yellow-red',
                          isSubstituted: true,
                          isReceivingTreatment: true,*/
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
