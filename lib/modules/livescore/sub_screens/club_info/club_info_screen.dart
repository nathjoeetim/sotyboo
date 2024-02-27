import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/new_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/overview/overview_tab.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/team_stats/team_stats_tab.dart';

import '../../../../components/avatar.dart';
import '../../../../core/theme/colors.dart';
import '../../components/back.dart';
import '../../components/star.dart';
import 'tabs/matches/matches_tab.dart';
import 'tabs/player_stats/player_stats_tab.dart';
import 'tabs/table/table_tab.dart';

class ClubInfoScreen extends StatefulWidget {
  const ClubInfoScreen({Key? key, this.selectedPage = 0}) : super(key: key);

  final int selectedPage;

  @override
  State<ClubInfoScreen> createState() => _ClubInfoScreenState();
}

class _ClubInfoScreenState extends State<ClubInfoScreen>
    with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 6,
      initialIndex: widget.selectedPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool isScroll) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.tertiary1,
                stretch: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(64.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomAppBar(),
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
                          debugPrint(index.toString());
                        },
                        tabs: const [
                          Text('Overview'),
                          Text('Matches'),
                          Text('Table'),
                          Text('Player Stats'),
                          Text('Team Stats'),
                          Text('News'),
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
              OverviewTab(),
              const MatchesTab(),
              const TeamTableTab(),
              const PlayerStatsTab(),
              TeamStats(),
              NewTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();

    isFavourite = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: const BoxDecoration(
        color: AppColors.tertiary1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Back(),
              SizedBox(width: 24.w),
              // Club
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Avatar(
                      radius: 16.r,
                      avatarType: AvatarType.thin,
                    ),
                    SizedBox(
                      width: 8.r,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manchester City',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.tertiary9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'England',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.tertiary7,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Star(
            isFavourite: isFavourite,
            isGreenStar: false,
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
          ),
        ],
      ),
    );
  }
}
