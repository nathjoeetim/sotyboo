import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/chat_details.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/comment_button.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/like_button.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/share_button.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/live_chat_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/viewmodel/live_chat_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/widget/share_bottom_sheet.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/overview/lineup_overview.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/football_pitch/football_pitch.dart';

import '../../../../../../core/theme/colors.dart';

class LineUpsTab extends StatefulWidget {
  const LineUpsTab({super.key});

  @override
  State<LineUpsTab> createState() => _LineUpsTabState();
}

class _LineUpsTabState extends State<LineUpsTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.tertiary1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              //Pitch
              const FootballPitch(),
              const CommentsContainer(),
              const LineupOverview()
              //const LineupExpansionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentsContainer extends StatefulWidget {
  const CommentsContainer({Key? key}) : super(key: key);

  @override
  State<CommentsContainer> createState() => _CommentsContainerState();
}

class _CommentsContainerState extends State<CommentsContainer> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();

    isLiked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveChatViewmodel>(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  LikeButton(
                    isLiked: isLiked,
                    showLabel: true,
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  SizedBox(width: 16.w),
                  CommentButton(
                    showLabel: true,
                    onPressed: () {
                      log('COMMENT');

                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        isDismissible: false,
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        builder: (context) => DraggableScrollableSheet(
                            maxChildSize: 0.946,
                            initialChildSize: 0.946,
                            //minChildSize: 0.5,
                            expand: false,
                            builder: (context, scrollController) =>
                                const LiveChatBottomSheet()),
                      );
                    },
                  ),
                  SizedBox(width: 16.w),
                  ShareButton(
                    showLabel: true,
                    onPressed: () {
                      log('SHARE');

                      onSharePressed(
                        context: context,
                        onCopyPressed: () {
                          log('COPY');
                        },
                        onSharePressed: () {
                          log('SHARE');
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 11.5.h),
              Divider(
                thickness: 1.h,
                color: AppColors.tertiary3,
              ),
              SizedBox(height: 11.5.h),
              ChatDetails(
                photos: model.getFirstThreeProfileImages().reversed.toList(),
                comments: model.getTotalCommentCount(),
                likes: 40,
                shares: 200,
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
class LineupExpansionWidget extends StatefulWidget {
  const LineupExpansionWidget({Key? key}) : super(key: key);

  @override
  State<LineupExpansionWidget> createState() => _LineupExpansionWidgetState();
}

class _LineupExpansionWidgetState extends State<LineupExpansionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded;
    int index = DefaultTabController.of(context).index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _handleTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: 45.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Expander box
                    Container(
                      width: 45.h,
                      height: 45.h,
                      padding: EdgeInsets.all(8.h),
                      decoration: const BoxDecoration(
                        color: AppColors.tertiary3,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.tertiary1,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tertiary4,
                              offset: Offset(0, 0.97.h),
                            ),
                          ],
                        ),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.5)
                                  .animate(_controller),
                              child: SvgPicture.asset(
                                'assets/svgs/arrow-down-thin.svg',
                                width: 13.53.w,
                                height: 13.53.w,
                                fit: BoxFit.scaleDown,
                                color: _isExpanded
                                    ? AppColors.primaryBase6
                                    : AppColors.tertiary8,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    //Tabs
                    Container(
                      width: double.maxFinite,
                      color: AppColors.tertiary2,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        labelPadding: EdgeInsets.zero,
                        splashFactory: NoSplash.splashFactory,
                        onTap: (int i) {
                          setState(() {
                            index == i;
                          });
                          //print(index);
                        },
                        tabs: [
                          TabContainer(
                            text: 'Comments',
                            isSelected: index == 0,
                          ),
                          TabContainer(
                            text: 'Overview',
                            isSelected: index == 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: IndexedStack(
            index: index,
            children: [
              Visibility(
                visible: index == 0,
                maintainState: true,
                child: const CommentsTab(),
              ),
              Visibility(
                visible: index == 1,
                maintainState: true,
                child: const LineupOverviewTab(),
              ),
            ],
          ),
          crossFadeState:
              closed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}


class TabContainer extends StatelessWidget {
  const TabContainer({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isSelected ? AppColors.primaryBase6 : AppColors.tertiary3,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.tertiary1 : AppColors.tertiary8,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
*/
