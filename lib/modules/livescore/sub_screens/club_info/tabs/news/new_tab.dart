import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/widgets/news_card.dart';

import '../../../../../../core/theme/colors.dart';
import 'model/news.dart';

class NewTab extends StatelessWidget {
  NewTab({Key? key}) : super(key: key);

  final List<News> news = [
    News(
      title: 'Juventus 4-2 Sampdoria: Controversial Rabiot goal spares blushes',
      time: '7 hours ago',
      image: 'baller',
    ),
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.tertiary2),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            //const NewsCard(),
            ...List.generate(
              news.length,
              (index) => Container(
                margin: EdgeInsets.only(bottom: 16.h),
                child: NewsCard(
                  news: news[index],
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
