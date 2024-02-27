import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/VerificationStatus.dart';
import 'package:sportboo_mobile_client/modules/profile/components/currency_sign.dart';

import '../../../../../../components/line.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../unils/utils.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({Key? key, this.isVerified = true}) : super(key: key);

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _currentFeature(),
              VerificationStatus(isVerified: isVerified),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        _titleText(),
        SizedBox(height: 16.h),
        _headerTile('Fiats Limits'),
        _bodyTile(text: 'Deposit', amount: '2,000,000'),
        const Line(),
        _bodyTile(text: 'Withdrawal', amount: '2,000,000'),
        _headerTile('P2P Bet Limits'),
        _bodyTile(text: 'Minimum', amount: '500'),
        const Line(),
        _bodyTile(text: 'Maximum', amount: '100,000'),
        _headerTile('Bookie Limits'),
        _bodyTile(text: 'Maximum bets', amount: 'Unlimited'),
        _headerTile('Crypto Limits'),
        _bodyTile(text: 'Deposit', amount: '2,000,000'),
        const Line(),
        _bodyTile(text: 'Withdrawal', amount: '2,000,000'),
      ],
    );
  }

  Widget _currentFeature() => Container(
        padding: EdgeInsets.only(
          top: 4.h,
          bottom: 4.h,
          left: 8.w,
          right: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryBase6,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              getSvg('crown-2'),
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(width: 8.w),
            Text(
              'Current features',
              style: TextStyle(
                color: AppColors.tertiary1,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );

  Widget _titleText() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        child: Text(
          'Features & Limits',
          style: TextStyle(
            color: AppColors.tertiary8,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget _headerTile(String text) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 16.w,
        ),
        color: AppColors.tertiary3,
        child: Row(
          children: [
            SvgPicture.asset(
              getSvg(isVerified ? 'tick-circle' : 'close-circle'),
              height: 24.h,
              width: 24.w,
              color:
                  isVerified ? AppColors.successBase3 : AppColors.dangerBase3,
            ),
            SizedBox(width: 8.w),
            _text(text),
            const Spacer(),
            _text('Daily'),
          ],
        ),
      );

  Widget _bodyTile({
    required String text,
    required String amount,
  }) {
    return Container(
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          _text(text),
          const Spacer(),
          if (amount != 'Unlimited' && amount != 'unlimited')
            const CurrencySign(),
          _text(amount),
        ],
      ),
    );
  }

  Widget _text(String text) => Text(
        text,
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}
