import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/text_fields/plain_text_field.dart';
import 'package:sportboo_mobile_client/modules/profile/components/wide_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/radio_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/viewmodels/add_deposit_card_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../../unils/formatters.dart';

class AddDepositCardScreen extends HookWidget {
  const AddDepositCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<AddDepositCardViewmodel>(context, listen: false).initialize();
    });

    return Unfocuser(
      child: CustomScaffold(
          title: 'Deposit',
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key:
                    Provider.of<AddDepositCardViewmodel>(context, listen: false)
                        .formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const CardTypeBox(),
                    const SizedBox(height: 32),
                    const CardNumberBox(),
                    const SizedBox(height: 20),
                    const CardNameBox(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(child: ExpiryDateBox()),
                        SizedBox(width: 16.w),
                        const Expanded(child: SecurityNumberBox()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const SaveCardButton(),
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

class CardTypeBox extends StatelessWidget {
  const CardTypeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBase6.withOpacity(0.24),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        margin: EdgeInsets.all(3.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
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
              'Debit/Credit Card',
              textScaleFactor: 1,
              style: TextStyle(
                color: AppColors.primaryBase6,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Image.asset(
              getImage('card-brand'),
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CardNumberBox extends HookWidget {
  const CardNumberBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddDepositCardViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Card Number',
          hintText: 'XXXX XXXX XXXX XXXX',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            MaskedInputFormatter('#### #### #### ####',
                allowedCharMatcher: RegExp('[0-9]'))
          ],
          validatorCallback: (value) {
            return model.cardNumberValidator(cardNumberValue: value);
          },
          onChangedCallback: (value) {
            model.cardNumber = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class CardNameBox extends HookWidget {
  const CardNameBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddDepositCardViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Name of Card',
          hintText: 'Enter Card Name',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validatorCallback: (value) {
            return model.cardNameValidator(cardNameValue: value);
          },
          onChangedCallback: (value) {
            model.cardName = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class ExpiryDateBox extends HookWidget {
  const ExpiryDateBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddDepositCardViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Expiry Date',
          hintText: 'MM/YY',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          inputFormatters: [ExpirationDateFormatter()],
          validatorCallback: (value) {
            return model.expiryDateValidator(expiryDateValue: value);
          },
          onChangedCallback: (value) {
            model.expiryDate = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class SecurityNumberBox extends HookWidget {
  const SecurityNumberBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    return Consumer<AddDepositCardViewmodel>(
      builder: (context, model, child) {
        return PlainTextField(
          textController: textController,
          labelText: 'Security Code',
          hintText: '000',
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            MaskedInputFormatter('###', allowedCharMatcher: RegExp('[0-9]'))
          ],
          validatorCallback: (value) {
            return model.cvvValidator(cvvValue: value);
          },
          onChangedCallback: (value) {
            model.cvv = value;
          },
          onSavedCallback: (value) {
            //return model.emailValidator(emailValue: value!);
          },
        );
      },
    );
  }
}

class SaveCardButton extends StatelessWidget {
  const SaveCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDepositCardViewmodel>(builder: (context, model, child) {
      return WideButton(
        text: 'Save card',
        onPressed: () {
          if (model.formKey.currentState!.validate()) {
            log('Adding...');
            model.addDepositCard();

            Navigator.pop(context);
          }
        },
      );
    });
  }
}
