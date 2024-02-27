import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../components/back.dart';
import 'tabs/competitions.dart';
import 'tabs/matches.dart';
import 'tabs/teams.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TopBar(),
              TabBar(
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                //controller: _tabController,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                indicatorColor: AppColors.primaryBase6,
                labelStyle: TextStyle(
                  fontSize: 16.sp / MediaQuery.of(context).textScaleFactor,
                  //fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBase6,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.primaryBase6,
                unselectedLabelColor: AppColors.tertiary8,
                tabs: const [
                  Text('Matches'),
                  Text('Competitions'),
                  Text('Teams'),
                ],
              ),
              const Divider(
                color: AppColors.tertiary3,
                thickness: 1,
                height: 1,
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Matches(),
                    Competitions(),
                    Teams(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          Back(),
          SizedBox(width: 20.w),
          Text(
            'Favorites',
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
