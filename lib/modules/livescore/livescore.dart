import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/favourite_club_chip.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/fixture_date.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/livescores_league.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/bet_p2p/bet_p2p.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/favourite/favourite_page.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/search_page.dart';

import '../../core/theme/colors.dart';
import '../../unils/navigation.dart';

class LiveScore extends StatelessWidget {

  const LiveScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //AppBar
          const TopBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  FavouriteClubsRow(),
                  const FixtureDate(),
                  const P2pCard(),
                  ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return LivescoresLeague();
                      }),
                  /* ListView(
                    shrinkWrap: true,
                    children: model.chatRequests.reversed.map((item) {
                      return League();
                    }).toList(),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.tertiary1,
      leading: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          'assets/svgs/user_icon.svg',
          width: 32.w,
          height: 32.h,
        ),
      ),
      centerTitle: true,
      title: SizedBox(
        width: 85.82.w,
        height: 24.h,
        child: SvgPicture.asset(
          'assets/svgs/sportboo.svg',
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            PageRouter.gotoWidget(
              context,
              const SearchPage(),
            );
          },
          child: SizedBox(
            width: 24.w,
            height: 24.h,
            child: SvgPicture.asset(
              'assets/svgs/search_normal.svg',
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}

class FavouriteClubsRow extends StatefulWidget {
  FavouriteClubsRow({Key? key}) : super(key: key);

  @override
  State<FavouriteClubsRow> createState() => _FavouriteClubsRowState();
}

class _FavouriteClubsRowState extends State<FavouriteClubsRow> {
  final List<String> clubArr = [
    'LIV',
    'MAN',
    'ARS',
    'MNC',
    'CHE',
    'TOT',
    'EVR',
    'AST'
  ];

  late String _selectedClub;

  @override
  void initState() {
    _selectedClub = clubArr[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      clubArr.length,
                      (index) => FavoriteClubChip(
                        club: clubArr[index],
                        isSelected: clubArr[index] == _selectedClub,
                        onPressed: () {
                          setState(() {
                            _selectedClub = clubArr[index];
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              PageRouter.gotoWidget(
                context,
                const FavouritePage(),
              );
            },
            child: const EditFavouriteChip(),
          ),
        ],
      ),
    );
  }


}

class P2pCard extends StatelessWidget {
  const P2pCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg-element-2.png'),
          fit: BoxFit.cover,
        ),
        color: AppColors.primary7,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'P2P Betting',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.tertiary1,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Create bet, bet peer-to-peer and win big.',
                  style: TextStyle(
                    color: AppColors.tertiary1,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const P2PBetting(),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary1,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/p2p.svg',
                              color: AppColors.primaryBase6,
                              width: 16.w,
                              height: 16.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'BET P2P',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.primaryBase6,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.primary5,
                      child: SvgPicture.asset('assets/svgs/arrow-right.svg'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
