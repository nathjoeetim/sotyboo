import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/back.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/star.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/club_info_screen.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/commentary/commentary_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/h2h/h2h_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/info/info_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/lineup.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/odds_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/report/report_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/stats_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/summary_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/table/table_tab.dart';

import '../../../../components/avatar.dart';
import '../../../../core/theme/colors.dart';

class LeagueMatchReviewScreen extends StatefulWidget {
  const LeagueMatchReviewScreen({Key? key, this.selectedPage = 0})
      : super(key: key);

  final int selectedPage;

  @override
  State<LeagueMatchReviewScreen> createState() =>
      _LeagueMatchReviewScreenState();
}

class _LeagueMatchReviewScreenState extends State<LeagueMatchReviewScreen>
    with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;

  late ScrollController _scrollController;

  final double scrollChangeLimit = 120.h;

  double topBarOpacity = 0.0;
  double clubBarOpacity = 1.0;
  double avatarPosition = 0.0;
  double timePosition = 0.0;
  Color tabsBackgroundColor = AppColors.tertiary2;

  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: 9, initialIndex: widget.selectedPage);

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      _onScroll();
    });

    isFavourite = false;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    setState(() {
      final double scrollOffset =
          _scrollController.hasClients ? _scrollController.offset : 0;
      // final double maxScrollExtent =
      //     _scrollController.position.maxScrollExtent;

      topBarOpacity = scrollOffset <= scrollChangeLimit
          ? scrollOffset / scrollChangeLimit
          : 1.0;
      clubBarOpacity = scrollOffset <= scrollChangeLimit
          ? 1.0 - (scrollOffset / scrollChangeLimit)
          : 0.0;
      avatarPosition = scrollOffset > scrollChangeLimit
          ? 0.0
          : (scrollChangeLimit - scrollOffset)
              .clamp(0, scrollChangeLimit)
              .toDouble();
      timePosition = scrollOffset > scrollChangeLimit
          ? 0.0
          : (scrollChangeLimit - scrollOffset)
              .clamp(0, scrollChangeLimit)
              .toDouble();

      tabsBackgroundColor = calculateColor(scrollOffset)!;
    });
  }

  Color? calculateColor(double scrollOffset) {
    if (scrollOffset <= scrollChangeLimit) {
      final ColorTween colorTween =
          ColorTween(begin: AppColors.tertiary2, end: AppColors.tertiary1);
      return colorTween.lerp(scrollOffset / scrollChangeLimit);
    } else {
      return AppColors.tertiary1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool isScroll) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.tertiary1,
                leading: const Back(),
                centerTitle: true,
                title: Opacity(
                  opacity: topBarOpacity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0.0, avatarPosition),
                        child: Avatar(
                          radius: 16.r,
                          avatarType: AvatarType.thin,
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Transform.translate(
                        offset: Offset(0.0, timePosition),
                        child: Text(
                          '15:30',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: AppColors.tertiaryBase10,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Transform.translate(
                        offset: Offset(0.0, avatarPosition),
                        child: Avatar(
                          radius: 16.r,
                          avatarType: AvatarType.thin,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Star(
                    isFavourite: isFavourite,
                    isGreenStar: false,
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                    },
                  ),
                  SizedBox(width: 16.w),
                ],
              ),
              SliverAppBar(
                backgroundColor: AppColors.tertiary2,
                //backgroundColor: tabsBackgroundColor,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(107.h),
                  child: Opacity(
                    opacity: clubBarOpacity,
                    child: const CustomAppBar(),
                  ),
                ),
              ),
              SliverAppBar(
                //backgroundColor: AppColors.tertiary2,
                backgroundColor: tabsBackgroundColor,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(-15.h),
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        physics: const BouncingScrollPhysics(),
                        controller: _tabController,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        indicatorColor: AppColors.primaryBase6,
                        labelStyle: TextStyle(
                          fontSize:
                              16.sp / MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBase6,
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: AppColors.primaryBase6,
                        unselectedLabelColor: AppColors.tertiary8,
                        onTap: (int i) {
                          setState(() {
                            index = i;
                          });
                          print(index);
                        },
                        tabs: const [
                          Text('Info'),
                          Text('Odds'),
                          Text('Summary'),
                          Text('Report'),
                          Text('Stats'),
                          Text('Lineups'),
                          Text('H2H'),
                          Text('Commentary'),
                          Text('Table'),
                        ],
                      ),
                      const Divider(
                        color: AppColors.tertiary3,
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              const InfoTab(),
              const OddsTab(),
              SummaryTab(),
              ReportTab(),
              StatsTab(),
              const LineUpsTab(),
              H2hTab(),
              const CommentaryTab(),
              const TableTab(),
            ],
          ),
        ),
      ),
    );
    /* return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool isScroll) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.tertiary1,
                stretch: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(192.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomAppBar(),
                      Container(
                        color: AppColors.tertiary2,
                        child: TabBar(
                          isScrollable: true,
                          physics: const BouncingScrollPhysics(),
                          controller: _tabController,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          indicatorColor: AppColors.primaryBase6,
                          labelStyle: TextStyle(
                            fontSize:
                                16.sp / MediaQuery.of(context).textScaleFactor,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBase6,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: AppColors.primaryBase6,
                          unselectedLabelColor: AppColors.tertiary8,
                          onTap: (int i) {
                            setState(() {
                              index = i;
                            });
                            print(index);
                          },
                          tabs: const [
                            Text('Info'),
                            Text('Odds'),
                            Text('Line-Ups'),
                            Text('H2H'),
                            Text('Commentary'),
                            Text('Table'),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.tertiary3,
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              const InfoPage(),
              const Odds(),
              const LineUps(),
              H2h(),
              const Commentary(),
              const TableTab(),
            ],
          ),
        ),
      ),
    );*/
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.tertiary2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Bar
          //_topBar(context: context),
          _leagueHeader(context: context),
          _clubsBar(),
        ],
      ),
    );
  }

  Widget _topBar({required BuildContext context}) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        decoration: const BoxDecoration(color: AppColors.tertiary1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                //Get.back();
              },
              child: Container(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset('assets/svgs/arrow-left.svg'),
              ),
            ),
            SvgPicture.asset(
              'assets/svgs/star.svg',
              color: AppColors.tertiary9,
              height: 24,
            ),
          ],
        ),
      );

  Widget _leagueHeader({required BuildContext context}) => InkWell(
        onTap: () {
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
          height: 57.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          decoration: const BoxDecoration(
            color: AppColors.tertiary2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  Column(
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
                ],
              ),
              SvgPicture.asset(
                'assets/svgs/arrow-right.svg',
                color: AppColors.tertiary9,
              ),
            ],
          ),
        ),
      );

  Widget _clubsBar() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            // First Club
            Club(clubName: 'Manchester City'),
            // Time
            Time(),
            // Second club
            Club(clubName: 'Manchester Utd'),
          ],
        ),
      );
}

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '15:30',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.tertiaryBase10,
            ),
            textScaleFactor: 1,
          ),
          SizedBox(height: 8.h),
          Text(
            'Today',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: AppColors.tertiary8,
            ),
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }
}

class Club extends StatelessWidget {
  const Club({Key? key, required this.clubName}) : super(key: key);

  final String clubName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(
          radius: 16.r,
          avatarType: AvatarType.thin,
        ),
        SizedBox(height: 8.h),
        Text(
          clubName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp / MediaQuery.of(context).textScaleFactor,
            color: AppColors.tertiaryBase10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
