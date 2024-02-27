import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/components/dotted_button.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/model/deposit_card.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/payment_method_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/payment/deposit/viewmodels/deposit_cards_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../../unils/navigation.dart';

class DepositCardsScreen extends HookWidget {
  const DepositCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* useEffect(() {
      Provider.of<DepositCardsViewmodel>(context, listen: false).initialize();
    });*/

    return Unfocuser(
      child: CustomScaffold(
          title: 'Deposit',
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  const SavedCardsBox(),
                  const AddNewCardButton(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          )),
    );
  }
}

class SavedCardsBox extends StatelessWidget {
  const SavedCardsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositCardsViewmodel>(
      builder: (context, model, child) {
        return Column(
          children: List.generate(
            model.depositCards.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: SavedCardTile(
                  depositCard: model.depositCards[index],
                  //isSelected: model.depositCards[index] == model.selectedCard,
                  onPressed: () {
                    //model.selectedCard = model.depositCards[index];
                  }),
            ),
          ),
        );
      },
    );
  }
}

class SavedCardTile extends StatelessWidget {
  const SavedCardTile({
    Key? key,
    required this.depositCard,
    //required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final DepositCard depositCard;
  //final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.h,
        bottom: 10.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg-element-2.png'),
          fit: BoxFit.cover,
        ),
        color: AppColors.primary7,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _thinText(depositCard.cardCategory ?? ''),
              SizedBox(height: 16.h),
              Image.asset(
                getImage('card-circuit'),
                width: 47.7.w,
                height: 32.h,
              ),
              SizedBox(height: 16.h),
              _thickText(depositCard.cardNumber ?? ''),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _thickText(depositCard.cardName ?? ''),
                  const Spacer(),
                  Column(
                    children: [
                      _thinText('Valid'),
                      _thinText('Thru'),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  _thinText(
                      '${depositCard.expiryMonth} / ${depositCard.expiryYear}'),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Visibility(
              visible: depositCard.cardType != null,
              child: SvgPicture.asset(
                getSvg(depositCard.cardType!),
                height: depositCard.cardType == 'mastercard' ? 32.h : 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thinText(String text) => Text(
        text.toUpperCase(),
        textScaleFactor: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget _thickText(String text) => Text(
        text,
        textScaleFactor: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedButton(
      text: 'Add new card',
      onPressed: () {
        PageRouter.gotoWidget(
          context,
          const PaymentMethodScreen(),
        );
      },
    );
  }
}
