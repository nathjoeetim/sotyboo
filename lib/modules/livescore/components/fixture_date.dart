import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/base_widget.dart';
import '../../../core/theme/colors.dart';
import '../viewmodel/livescore_viewmodel.dart';

class FixtureDate extends StatelessWidget {
  const FixtureDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LiveScoreViewmodel>(
        viewModel: LiveScoreViewmodel(),
        initViewModel: (model) {
          model.instantiate();
        },
        builder: (BuildContext context, LiveScoreViewmodel model, _) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 1.h,
                color: AppColors.tertiary3,
              ),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Live Container
                Container(
                  margin: EdgeInsets.symmetric(vertical: 9.5.h),
                  height: 29.h,
                  width: 46.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBase6,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      'Live',
                      style: TextStyle(
                        color: AppColors.tertiary1,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                // Dates
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: 48.h,
                      child: Row(
                        children: List.generate(
                          model.fixtureDates.length,
                          (index) => InkWell(
                            onTap: () {
                              model.setSelectedDate(index: index);
                            },
                            child: Container(
                              margin: model.isSelected(index: index)
                                  ? EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                    )
                                  : EdgeInsets.zero,
                              padding: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                top: model.isSelected(index: index) ? 3.h : 0.h,
                              ),
                              decoration: model.isSelected(index: index)
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 3.h,
                                          color: AppColors.primaryBase6,
                                        ),
                                      ),
                                    )
                                  : null,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    model.fixtureDates[index].day,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: model.isSelected(index: index)
                                          ? AppColors.primaryBase6
                                          : AppColors.tertiaryBase10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    model.fixtureDates[index].date,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: model.isSelected(index: index)
                                          ? AppColors.primaryBase6
                                          : AppColors.tertiary8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                // Calendar
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  height: 32.h,
                  width: 32.w,
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBase6,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset('assets/svgs/calendar.svg'),
                ),
              ],
            ),
          );
        });
  }
}
/*

class FixtureDate extends StatelessWidget {
  const FixtureDate({super.key, required this.fixture});

  final List fixture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Live Container
          Container(
            margin: EdgeInsets.symmetric(vertical: 13.5.h),
            */
/* padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 8.h,
            ),*/ /*

            height: 29.h,
            width: 46.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBase6,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                'Live',
                style: TextStyle(
                  color: AppColors.tertiary1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Dates
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  fixture.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: 8.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fixture[index]['day'],
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.tertiaryBase10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          fixture[index]['date'],
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.tertiary8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Calendar
          Container(
<<<<<<< HEAD
            padding: const EdgeInsets.all(4),
=======
            margin: EdgeInsets.symmetric(vertical: 12.h),
            height: 32.h,
            width: 32.w,
            padding: EdgeInsets.all(4.h),
>>>>>>> feature/livescores
            decoration: BoxDecoration(
              color: AppColors.primaryBase6,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset('assets/svgs/calendar.svg'),
          ),
        ],
      ),
    );
  }
}
*/
