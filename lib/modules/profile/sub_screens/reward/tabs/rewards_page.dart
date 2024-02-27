import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/components/amount_coin.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/widgets/closer.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/widgets/custom_dialog.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiary0,
      body: Stack(
        children: [
          const TopBackground(),
          Positioned(
            top: 68.5.h,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const RewardAppBar(),
                  SizedBox(height: 40.5.h),
                  const MainCoinCard(),
                  SizedBox(height: 16.h),
                  // Small coin containers
                  Row(
                    children: [
                      const EarnedCoinsCard(),
                      SizedBox(width: 16.w),
                      const RedeemedCoinsCard(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const RedeemCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBackground extends StatelessWidget {
  const TopBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 234.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary7,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
        ),
      ),
    );
  }
}

class RewardAppBar extends StatelessWidget {
  const RewardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rewards',
          style: TextStyle(
            fontSize: 31.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.tertiary1,
          ),
        ),
        //Close Button
        const Closer(),
      ],
    );
  }
}

class MainCoinCard extends StatelessWidget {
  const MainCoinCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingType: PaddingType.big,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AmountCoin(
                amount: '5000',
              ),
              SizedBox(height: 8.h),
              Text(
                'Token',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.tertiaryBase10,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5000',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiaryBase10,
                    ),
                  ),
                  Text(
                    'SPB',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.tertiary4,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                '~ \$200',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EarnedCoinsCard extends StatelessWidget {
  const EarnedCoinsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppCard(
        paddingType: PaddingType.small,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    getImage('green-coin'),
                    height: 52.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5000',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.tertiaryBase10,
                            ),
                          ),
                          Text(
                            'SPB',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.tertiary4,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '~ \$200',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.tertiary6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                'Earned Token',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiaryBase10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RedeemedCoinsCard extends StatelessWidget {
  const RedeemedCoinsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppCard(
        paddingType: PaddingType.small,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    getImage('yellow-coin'),
                    height: 52.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5000',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.tertiaryBase10,
                            ),
                          ),
                          Text(
                            'SPB',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.tertiary4,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '~ \$200',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.tertiary6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                'Redeemed Token',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiaryBase10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RedeemCard extends StatelessWidget {
  const RedeemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingType: PaddingType.big,
      isGreenBottomBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            getSvg('coins'),
            height: 120.h,
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('5000 ',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.tertiaryBase10,
                  )),
              Text(
                'SPB',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.tertiary4,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'You have earned 5000SPB Token.',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.tertiary8,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AnimatedDialog();
                },
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              backgroundColor: AppColors.primaryTint9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              'Redeem',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.tertiary1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
