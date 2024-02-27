import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/components/texts/profile_header_text.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/deposit_cards_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/withdrawal_accounts_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

import '../../../../../../unils/navigation.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Payment',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            const TitleBar(),
            SizedBox(height: 32.h),
            PaymentTile(
                title: 'Desposits',
                onPressed: () {
                  PageRouter.gotoWidget(
                    context,
                    const DepositCardsScreen(),
                  );
                }),
            PaymentTile(
                title: 'Withdrawal',
                onPressed: () {
                  PageRouter.gotoWidget(
                    context,
                    const WithdrawalAccountsScreen(),
                  );
                }),
          ],
        ));
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileHeaderText(text: 'Cash Payment Methods'),
          SizedBox(height: 16.h),
          Text(
            'Choose how you want to deposit or withdraw cash.',
            style: TextStyle(
              color: AppColors.tertiary8,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.20,
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          border: Border(
              bottom: BorderSide(
            width: 1.h,
            color: AppColors.tertiary3,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(
              'assets/svgs/arrow-right.svg',
              height: 20.h,
              width: 20.w,
              color: AppColors.tertiaryBase10,
            ),
          ],
        ),
      ),
    );
  }
}
