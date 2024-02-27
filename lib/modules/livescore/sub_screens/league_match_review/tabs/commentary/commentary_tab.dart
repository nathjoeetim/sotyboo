import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import 'components/comment_tile.dart';
import 'components/selected_comments.dart';
import 'model/commentary.dart';

class CommentaryTab extends StatefulWidget {
  const CommentaryTab({Key? key}) : super(key: key);

  @override
  State<CommentaryTab> createState() => _CommentaryTabState();
}

class _CommentaryTabState extends State<CommentaryTab>
    with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;

  List<Commentary> comments = [
    Commentary(
      commentaryType: CommentaryType.whistle,
      time: '90+3',
      message:
          'That’s it for today, Michael Oliver has blown his whistle and the game is over.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.goal,
      time: '90+3',
      message:
          'GOAL! That’s a perfect strike from the spot by Anthony Martial (Manchester United) into the top right corner, giving goalkeeper Ederson no chance!',
      image: 'man_u_goal',
    ),
    Commentary(
      commentaryType: CommentaryType.time,
      time: '90',
      message: 'We’ll have 3 min. of added time',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.foul,
      time: '90',
      message:
          'Joao Cancelo (Manchester City) commits a rough challenge and Michael Oliver blows his whistle for a foul. The referee blows his whistle and awards Manchester Utd a penalty after chaos inside the box.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.corner,
      time: '85',
      message: 'Sergio Gomez (Manchester City) will take a corner kick.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.info,
      time: '82',
      message:
          'We can have a look at the statistics now, particularly the total attempts - 21:6.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.yellowCard,
      time: '80',
      message:
          'Bruno Fernandes (Manchester United) is cautioned by the referee for a foul that he committed a little earlier.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.redCard,
      time: '78',
      message:
          'Rashford (Manchester United) is sent out by the referee for a foul that he committed against Harland.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.substitution,
      time: '75',
      message:
          'Bruno Fernandes (Manchester United) is cautioned by the referee for a foul that he committed a little earlier.',
      image: '',
    ),
    Commentary(
      commentaryType: CommentaryType.plain,
      time: '63',
      message: 'The Manchester City players are exhanging some short passes.',
      image: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.tertiary1,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const SelectableCommentText(),
              /*child: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,

                // splashFactory: InkSplash.       ,
                splashFactory: NoSplash.splashFactory,

                // dividerColor: Colors.transparent,
                onTap: (int i) {
                  setState(() {
                    index = i;
                  });
                  print(index);
                },
                tabs: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      decoration: index == 0 ? decoration() : decoration2(),
                      child: Text(
                        'ALL COMMENTS',
                        style: textStyle(0, index),
                      )),
                  // tabController.

                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: index == 1 ? decoration() : decoration2(),
                      child: Text('IMPORTANT', style: textStyle(1, index))),
                ],
              ),*/
            ),

            // Comments
            ...List.generate(
              comments.length,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommentTile(
                    commentType: comments[index].commentaryType,
                    time: comments[index].time,
                    message: comments[index].message,
                    image: comments[index].image,
                  ),
                  index < (comments.length - 1)
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          child: Divider(
                            thickness: 1.h,
                            color: AppColors.tertiary2,
                          ),
                        )
                      : SizedBox(height: 41.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
