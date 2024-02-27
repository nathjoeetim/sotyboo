import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';
import '../model/news.dart';
import '../sub_screens/new_details.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    this.isBordered = false,
  });

  final News news;
  final bool isBordered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewDetails(),
          ),
        );
        /*    Get.to(() => NewDetails());*/
      },
      child: Container(
        height: 102.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2.h),
              blurRadius: 8.r,
              color: AppColors.tertiaryBase10.withOpacity(0.08),
            ),
          ],
          border: isBordered
              ? Border.all(
                  width: 1.h,
                  color: AppColors.tertiary3,
                )
              : const Border(),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            // Image
            Expanded(
              flex: 1,
              child: Container(
                height: 86.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/${news.image}.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      news.title,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.tertiary9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary3,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          'MATCH REPORT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: AppColors.tertiary8,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          news.time,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.tertiary7,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
