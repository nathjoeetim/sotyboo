import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/back.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/sectionTitle.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/selectable_text_container.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/star.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/tabs/all.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/tabs/competitions.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/tabs/players.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/tabs/teams.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/viewmodel/search_viewmodel.dart';

import '../../../../core/theme/colors.dart';

class SearchPage extends HookWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Unfocuser(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.tertiary1,
          body: Column(
            children: [
              TopBar(
                searchController: searchController,
              ),
              const TabBarContainer(),
              const BodyContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  TopBar({Key? key, required this.searchController}) : super(key: key);

  final TextEditingController searchController;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final keyboardHeight = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = keyboardHeight > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Stack(
        children: [
          // Back
          _backButton(),
          // Search background
          _searchBackground(),
          // Search bar
          _searchBar(),
          //Line
          _line(),
          // Search Button
          _searchButton(),
        ],
      ),
    );
  }

  Widget _backButton() => const Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        child: Back(),
      );

  Widget _searchBackground() => AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        left: 36.w,
        top: 8,
        bottom: 8,
        // 60
        right: isKeyboardVisible ? 60.w : 0,
        child: Container(
          //width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.tertiary3,
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
      );

  Widget _searchBar() => Positioned(
        top: 0,
        bottom: 0,
        left: 48.w,
        right: 68.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/search-outlined.svg',
              height: 16.h,
              width: 16.h,
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: TextField(
                controller: widget.searchController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  // Remove Underline
                  decorationThickness: 0.0,
                ),
                cursorColor: AppColors.primaryBase6,
                onChanged: (value) {
                  ////////
                },
                decoration: InputDecoration(
                  hintText: 'Find games, teams & more...',
                  hintStyle: TextStyle(
                    color: AppColors.tertiary6,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 4.h),
            AnimatedOpacity(
              opacity: isKeyboardVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: InkWell(
                onTap: () {
                  widget.searchController.clear();
                },
                child: Padding(
                  padding: EdgeInsets.all(4.h),
                  child: SvgPicture.asset(
                    'assets/svgs/close-circle.svg',
                    height: 16.h,
                    width: 16.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _line() => Positioned(
        top: 16.h,
        bottom: 16.h,
        right: 64.w,
        child: AnimatedOpacity(
          opacity: isKeyboardVisible ? 0 : 1,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 1.w,
            height: double.maxFinite,
            color: AppColors.tertiary4,
          ),
        ),
      );

  Widget _searchButton() => Positioned(
        top: 0,
        bottom: 0,
        right: 12,
        child: InkWell(
          onTap: () {
            /// Search
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                'Search',
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.primaryBase6,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
}

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border(
            bottom: BorderSide(
          width: 1.h,
          color: AppColors.tertiary3,
        )),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Consumer<SearchViewmodel>(
            builder: (context, model, child) {
              return SelectableTextContainer(
                texts: model.tabs.map((tab) => tab.name).toList(),
                selectedText: model.selectedTab.name,
                selectableType: SelectableType.search,
                onPressed: (value) {
                  log('Value --->  $value');

                  model.setSelectedTab(searchTabName: value);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewmodel>(
      builder: (context, model, child) {
        late Widget bodyWidget;

        switch (model.selectedTab) {
          case SearchTab.all:
            bodyWidget = const All();
            break;
          case SearchTab.competitions:
            bodyWidget = const Competitions();
            break;
          case SearchTab.teams:
            bodyWidget = const Teams();
            break;
          case SearchTab.players:
            bodyWidget = const Players();
            break;
          default:
            bodyWidget = const All();
        }

        return Expanded(
          child: Container(
            color: AppColors.tertiary2,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: bodyWidget,
              ),
            ),
          ),
        );
      },
    );
  }
}
