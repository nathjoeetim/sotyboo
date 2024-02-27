import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../league_match_review/league_match_review_screen.dart';

enum MatchesTab { fixtures, result }

class MatchTile extends StatelessWidget {
  MatchTile({
    Key? key,
    required this.matchesTab,
    required this.isAudio,
    required this.date,
    required this.isPostponed,
    required this.firstTeam,
    required this.secondTeam,
    this.firstTeamScore,
    this.secondTeamScore,
    required this.firstTeamFavourite,
    required this.secondTeamFavourite,
    required this.isFavourite,
  }) : super(key: key);

  final MatchesTab matchesTab;
  final bool isAudio;
  final String date;
  bool isPostponed;
  final String firstTeam;
  final String secondTeam;
  final String? firstTeamScore;
  final String? secondTeamScore;
  final bool firstTeamFavourite;
  final bool secondTeamFavourite;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    late Widget leading;
    late Widget goalWidget;

    if (matchesTab == MatchesTab.result) {
      isPostponed = false;

      leading = Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          _timeText(date),
          SizedBox(height: 16.h),
          _timeText('FT'),
        ],
      );

      goalWidget = Column(
        children: [
          _goal(firstTeamScore!),
          SizedBox(height: 8.h),
          _goal(secondTeamScore!),
        ],
      );
    } else {
      if (isPostponed) {
        leading = Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            _timeText(date),
            SizedBox(height: 16.h),
            _timeText('Postp.'),
          ],
        );

        goalWidget = Column(
          children: [
            _goal('0'),
            SizedBox(height: 8.h),
            _goal('0'),
          ],
        );
      } else {
        leading = _timeText(date);
        goalWidget = const SizedBox.shrink();
      }
    }

    if (isAudio) {
      leading = Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          _headSet(),
          SizedBox(height: 16.h),
          _timeText(isPostponed ? 'Postp.' : date),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        /*  Provider.of<LiveScoresPageViewViewmodel>(context, listen: false)
              .leagueMatchReviewPage();*/
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LeagueMatchReviewScreen(),
          ),
        );
        /* Get.to(
            const LeagueMatchReview(),
          );*/
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.w,
              color: AppColors.tertiary3,
            ),
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  // Before match date Container
                  leading,
                  SizedBox(width: 16.w),
                  // Clubs
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _club(
                          club: firstTeam,
                          isFavourite: firstTeamFavourite,
                        ),
                        SizedBox(height: 8.h),
                        _club(
                          club: secondTeam,
                          isFavourite: secondTeamFavourite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                // Score
                goalWidget,
                SizedBox(width: 24.w),
                //Star
                InkWell(
                  onTap: () {
                    ///TODO: Star
                  },
                  child: SvgPicture.asset(
                    isFavourite
                        ? 'assets/svgs/star-broken.svg'
                        : 'assets/svgs/star.svg',
                    height: 24.h,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _headSet() => SvgPicture.asset(
        'assets/svgs/headset.svg',
      );
  Widget _timeText(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.tertiaryBase10,
        ),
      );

  Widget _club({
    required String club,
    required bool isFavourite,
  }) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Avatar(
            radius: 12.r,
            avatarType: AvatarType.thin,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            club,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Visibility(
            visible: isFavourite,
            child: SvgPicture.asset(
              'assets/svgs/star-broken.svg',
              height: 16.h,
              width: 16.h,
            ),
          ),
          const Spacer(),
        ],
      );

  Widget _goal(String text) => Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13.sp,
        ),
      );
}
