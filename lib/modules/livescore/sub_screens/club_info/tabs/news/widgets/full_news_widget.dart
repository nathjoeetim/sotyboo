import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../components/avatar.dart';
import '../../../../../../../core/theme/colors.dart';
import '../model/news.dart';
import 'news_card.dart';

class FullNewsWidget extends StatelessWidget {
  const FullNewsWidget({
    Key? key,
    required this.tags,
    required this.news,
  }) : super(key: key);

  final List<String> tags;
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            'Juventus 4-2 Sampdoria: Controversial Rabiot goal spares blushes',
            style: TextStyle(
              color: AppColors.tertiary9,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                'assets/images/new-image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _association(),
          SizedBox(height: 8.h),
          Divider(
            thickness: 1.h,
            color: AppColors.tertiary3,
          ),
          SizedBox(height: 16.h),
          Text(
            'news details here news details here news details here news details here news news news news news news details here news details here news details here news details here news news news news news',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.tertiaryBase10,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'TAGS',
            style: TextStyle(
              color: AppColors.tertiary8,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: List.generate(
              tags.length,
              (i) => Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6.h,
                  horizontal: 12.w,
                ),
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.tertiary3,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  tags[i],
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.tertiary8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'RELATED ARTICLES',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
          SizedBox(height: 16.h),
          ...List.generate(
            news.length,
            (index) => Container(
              margin: EdgeInsets.only(bottom: 16.h),
              child: NewsCard(
                news: news[index],
              ),
            ),
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }

  Widget _association() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Avatar(radius: 16.r),
              SizedBox(width: 8.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PA Sport Staff',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: AppColors.tertiary9,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Press Association',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: AppColors.tertiary7,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '18/02/2023',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColors.tertiary9,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '15:30',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColors.tertiary7,
                ),
              ),
            ],
          )
        ],
      );
}
