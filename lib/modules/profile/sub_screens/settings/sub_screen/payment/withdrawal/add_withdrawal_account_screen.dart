import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/drop_down_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/radio_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/withdrawal/viewmodels/add_withdrawal_account_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class AddWithdrawalAccountScreen extends HookWidget {
  const AddWithdrawalAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<AddWithdrawalAccountViewmodel>(context, listen: false)
          .initialize();
    });

    return Unfocuser(
      child: CustomScaffold(
          title: 'Withdrawal',
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: Provider.of<AddWithdrawalAccountViewmodel>(context,
                        listen: false)
                    .formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const BankAccountBox(),
                    const SizedBox(height: 32),
                    const BankNameBox(),
                    const SizedBox(height: 20),
                    const AccountNumberBox(),
                    const SizedBox(height: 20),
                    const CountryBox(),
                    const SizedBox(height: 20),
                    const AccountNameBox(),
                    const SizedBox(height: 24),
                    const SaveAccountButton(),
                    const SizedBox(height: 32),
                    Text(
                      'The information given below must match the name on your card or your bank may decline your purchase. All information is kept confidential.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.tertiary8,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class BankAccountBox extends StatelessWidget {
  const BankAccountBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBase6.withOpacity(0.24),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        margin: EdgeInsets.all(3.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.primary1,
          border: Border.all(
            width: 1.h,
            color: AppColors.primaryBase6,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            const RadioButton(
              isSelected: true,
            ),
            SizedBox(width: 8.w),
            Text(
              'Bank Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryBase6,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
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
          ],
        ),
      ),
    );
  }
}

class BankNameBox extends HookWidget {
  const BankNameBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddWithdrawalAccountViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: textController,
          labelText: 'Bank Name',
          hintText: 'Enter Bank Name',
          items: model.bankNameItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            textController.text = selectedItem;
            model.setBankName(selectedBankName: selectedItem);
          },
        );
      },
    );
  }
}

class AccountNumberBox extends HookWidget {
  const AccountNumberBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddWithdrawalAccountViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Account Number',
          hintText: 'Enter Account Number',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          validatorCallback: (value) {
            if (value!.length != 10) {
              return 'Enter a valid Account Number';
            }

            return null;
          },
          onChangedCallback: (value) {
            model.accountNumber = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class CountryBox extends HookWidget {
  const CountryBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddWithdrawalAccountViewmodel>(
      builder: (context, model, child) {
        return DropDownField(
          textController: textController,
          labelText: 'Country',
          hintText: 'Enter your Country',
          items: model.countryItems,
          onPressed: (selectedItem) {
            log('Selected item: $selectedItem');

            textController.text = selectedItem;
            model.setCountry(selectedCountry: selectedItem);
          },
        );
      },
    );
  }
}

class AccountNameBox extends StatelessWidget {
  const AccountNameBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.tertiary3,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.h,
            color: AppColors.tertiary5,
          )),
      child: Text(
        'Account name will appear here',
        textScaleFactor: 1,
        style: TextStyle(
          color: AppColors.tertiary6,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class SaveAccountButton extends StatelessWidget {
  const SaveAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddWithdrawalAccountViewmodel>(
        builder: (context, model, child) {
      return WideButton(
        text: 'Save account',
        onPressed: () {
          if (model.formKey.currentState!.validate()) {
            log('Adding...');
            model.addWithdrawalAccount();

            Navigator.pop(context);

            /*PageRouter.gotoWidget(
              context,
              const WithdrawalAccountsScreen(),
            );*/
          }
        },
      );
    });
  }
}
