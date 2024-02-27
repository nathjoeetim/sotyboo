import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/radio_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/add_deposit_card_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../../unils/navigation.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Deposit',
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(
                  'Select Payment Method',
                  style: TextStyle(
                    color: AppColors.tertiaryBase10,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.h),
                PaymentMethodTile(
                  text: 'Debit/Credit Card',
                  logo: 'card-brand',
                  onPressed: () {
                    PageRouter.gotoWidget(
                      context,
                      replacePreviousScreen: true,
                      const AddDepositCardScreen(),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                PaymentMethodTile(
                  text: 'Paypal',
                  logo: 'paypal',
                  onPressed: () {
                    /*PageRouter.gotoWidget(
                      context,
                      const AddWithdrawalAccountScreen(),
                    );*/
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ));
  }
}

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    Key? key,
    required this.text,
    required this.logo,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String logo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
          horizontal: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.tertiary0,
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary3,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            const RadioButton(),
            SizedBox(width: 8.w),
            Text(
              text,
              textScaleFactor: 1,
              style: TextStyle(
                color: AppColors.tertiary8,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Image.asset(
              getImage(logo),
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
