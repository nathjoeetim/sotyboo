import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/avatar.dart';
import '../../../core/theme/colors.dart';
import '../sub_screens/club_info/club_info_screen.dart';
import '../sub_screens/league_match_review/league_match_review_screen.dart';

class LivescoresLeague extends StatelessWidget {
  const LivescoresLeague({super.key});

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
              return _MatchTile();
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

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClubInfoScreen(
              selectedPage: 2,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: const BoxDecoration(
          color: AppColors.tertiary0,
          border: Border(
            top: BorderSide(
              width: 1,
              color: AppColors.tertiary3,
            ),
            /* bottom: BorderSide(
                width: 1,
                color: AppColors.tertiary3,
              ),*/
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //Flag
                Container(
                  width: 28.w,
                  height: 20.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 14.h,
                  ),
                  child: Image.asset('assets/images/EN.png'),
                ),

                SizedBox(width: 16.w),
                // League
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
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
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SvgPicture.asset('assets/svgs/arrow-right.svg')
          ],
        ),
      ),
    );
  }
}

class _MatchTile extends StatelessWidget {
  const _MatchTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            top: BorderSide(
              width: 1.w,
              color: AppColors.tertiary3,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 8.h,
            ),
            // Match info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Time
                      Text(
                        '15:30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiaryBase10,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // Clubs
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _club(club: 'Manchester City'),
                            SizedBox(height: 8.h),
                            _club(club: 'Manchester Utd'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // Score
                    Column(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 24.w),
                    //Star
                    InkWell(
                      onTap: () {
                        ///TODO: Star
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/star_empty.svg',
                        height: 24.h,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Placed bet
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: AppColors.tertiary2,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'PLACED BET: 12',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.tertiary8,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _club({required String club}) => Row(
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
          const Spacer(),
        ],
      );
}
