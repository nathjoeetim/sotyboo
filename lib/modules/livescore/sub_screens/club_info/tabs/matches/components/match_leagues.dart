import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/colors.dart';
import 'match_tile.dart';

class MatchLeagues extends StatelessWidget {
  const MatchLeagues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const MatchLeague();
        });
  }
}

class MatchLeague extends StatelessWidget {
  const MatchLeague({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        const _LeagueHeader(),
        ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MatchTile(
                matchesTab: MatchesTab.fixtures,
                isAudio: false,
                date: 'OCT 8',
                isPostponed: false,
                firstTeam: 'Manchester City',
                secondTeam: 'Arsenal',
                firstTeamScore: '3',
                secondTeamScore: '1',
                firstTeamFavourite: true,
                secondTeamFavourite: false,
                isFavourite: true,
              );
            }),
        /* ListView(
          shrinkWrap: true,
          children: model.chatRequests.reversed.map((item) {
            return MatchTile();
          }).toList(),
        ),*/
      ],
    );
  }
}

class _LeagueHeader extends StatelessWidget {
  const _LeagueHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*Provider.of<LiveScoresPageViewViewmodel>(context, listen: false)
              .clubInfoPage();*/

        /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClubInfoScreen(
              selectedPage: 2,
            ),
          ),
        );*/
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: const BoxDecoration(
          color: AppColors.tertiary2,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.tertiary3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //Flag
                Container(
                  //width: 28.w,
                  height: 20.h,
                  /* margin: EdgeInsets.symmetric(
                    vertical: 18.5.h,
                  ),*/
                  child: Image.asset('assets/images/EN.png'),
                ),

                SizedBox(width: 16.w),
                // League
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Premier League',
                        style: TextStyle(
                          color: AppColors.tertiary9,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'England',
                        style: TextStyle(
                          color: AppColors.tertiary7,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/svgs/arrow-right.svg',
              color: AppColors.tertiary9,
            )
          ],
        ),
      ),
    );
  }
}
