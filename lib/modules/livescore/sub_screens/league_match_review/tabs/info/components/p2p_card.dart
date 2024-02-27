import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../bet_p2p/bet_p2p.dart';

class P2PCard extends StatelessWidget {
  const P2PCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg-element.png'),
          fit: BoxFit.cover,
        ),
        color: AppColors.primary7,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'P2P Betting',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.tertiary1,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Bet on Manchester City vs Manchester United with peer to peer betting.',
                  style: TextStyle(
                    color: AppColors.tertiary1,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const P2PBetting()),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary1,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/p2p.svg',
                              color: AppColors.primaryBase6,
                              width: 16.w,
                              height: 16.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'BET P2P',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.primaryBase6,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.primary5,
                      child: SvgPicture.asset('assets/svgs/arrow-right.svg'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
