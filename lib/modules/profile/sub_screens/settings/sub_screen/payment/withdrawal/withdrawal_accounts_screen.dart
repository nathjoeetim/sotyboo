import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/dotted_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/radio_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/add_withdrawal_account_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/model/withdrawal_account.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/viewmodels/withdrawal_accounts_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../../unils/navigation.dart';

class WithdrawalAccountsScreen extends HookWidget {
  const WithdrawalAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<WithdrawalAccountsViewmodel>(context, listen: false)
          .initialize();
    });

    return Unfocuser(
      child: CustomScaffold(
          title: 'Withdrawal Accounts',
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: const [
                  SizedBox(height: 24),
                  SavedAccountsBox(),
                  AddNewAccountButton(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          )),
    );
  }
}

class SavedAccountsBox extends StatelessWidget {
  const SavedAccountsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WithdrawalAccountsViewmodel>(
      builder: (context, model, child) {
        return Column(
          children: List.generate(
            model.withdrawalAccounts.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: SavedAccountTile(
                  withdrawalAccount: model.withdrawalAccounts[index],
                  isSelected:
                      model.withdrawalAccounts[index] == model.selectedAccount,
                  onPressed: () {
                    model.selectedAccount = model.withdrawalAccounts[index];
                  }),
            ),
          ),
        );
      },
    );
  }
}

class SavedAccountTile extends StatelessWidget {
  const SavedAccountTile({
    Key? key,
    required this.withdrawalAccount,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final WithdrawalAccount withdrawalAccount;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //log()

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBase6.withOpacity(0.24)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Container(
          margin: EdgeInsets.all(3.h),
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary1 : AppColors.tertiary0,
            border: Border.all(
              width: 1.h,
              color: isSelected ? AppColors.primaryBase6 : AppColors.tertiary3,
            ),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            children: [
              _child(
                  isBankAccount:
                      withdrawalAccount.accountType == 'Bank Account'),
              const Spacer(),
              RadioButton(isSelected: isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _child({required bool isBankAccount}) {
    if (isBankAccount) {
      return Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: AppColors.primary2,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              getSvg('bank'),
              height: 24.h,
              width: 24.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            withdrawalAccount.bankName ?? '',
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 4.w),
          CircleAvatar(
            radius: 3.r,
            backgroundColor: AppColors.primaryBase6,
          ),
          SizedBox(width: 4.w),
          Text(
            withdrawalAccount.accountNumber ?? '',
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.tertiaryBase10,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            getImage('paypal'),
            height: 24.h,
            width: 92.4.w,
          ),
          SizedBox(height: 8.h),
          Text(
            withdrawalAccount.email ?? '',
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.tertiary8,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    }
  }
}

class AddNewAccountButton extends StatelessWidget {
  const AddNewAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedButton(
      text: 'Add new bank',
      onPressed: () {
        PageRouter.gotoWidget(
          context,
          const AddWithdrawalAccountScreen(),
        );
      },
    );
  }
}
