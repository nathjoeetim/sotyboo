import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/theme/colors.dart';
import '../model/news.dart';
import '../widgets/full_news_widget.dart';

class NewDetails extends StatelessWidget {
  NewDetails({Key? key}) : super(key: key);

  var tags = ['League 1', 'Juventus', 'Sampdora'];

  final List<News> news = [
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
    return Scaffold(
      backgroundColor: AppColors.tertiary2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App bar
              const CustomAppBar(),
              FullNewsWidget(
                tags: tags,
                news: news,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        color: AppColors.tertiary1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back
          InkWell(
            onTap: () {
              Navigator.pop(context);
              //Get.back();
            },
            child: SvgPicture.asset(
              'assets/svgs/arrow-left.svg',
              height: 24,
              width: 24,
            ),
          ),

          Text(
            'News',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColors.tertiary9,
            ),
          ),

          // Share
          SvgPicture.asset(
            'assets/svgs/share-news.svg',
            color: AppColors.tertiary9,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}
