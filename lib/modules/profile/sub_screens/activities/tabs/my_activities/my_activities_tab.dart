import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/components/currency_sign.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/my_activities/viewmodel/my_activities_viewmodel.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

import '../../../../../../components/line.dart';

class MyActivitiesTab extends StatelessWidget {
  const MyActivitiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MyActivitiesSelectableContainer(),
            SizedBox(height: 24.h),
            const BodyContainer(),
          ],
        ),
      ),
    );
  }
}

class MyActivitiesSelectableContainer extends StatelessWidget {
  const MyActivitiesSelectableContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: AppColors.tertiary3,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Consumer<MyActivitiesViewmodel>(
        builder: (context, model, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: model.tabs.map((tab) => tab.value).toList().map((text) {
              final isSelected = text == model.selectedTab.value;

              return Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    log('Value --->  $text');

                    model.setSelectedTab(statsTabName: text);
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                    ),
                    decoration: isSelected
                        ? BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.r,
                                offset: Offset(0, 2.h),
                                color:
                                    AppColors.tertiaryBase10.withOpacity(0.08),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(24.r),
                            color: AppColors.tertiary1,
                          )
                        : null,
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primaryBase6
                              : AppColors.tertiary8,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopCards(),
          SizedBox(height: 16.h),
          const TotalBets(),
          SizedBox(height: 16.h),
          const DepositOrWithdrawal(),
          SizedBox(height: 16.h),
          const DepositLimit(),
          SizedBox(height: 16.h),
          const AmountStaked(),
          const RecentStakes(),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class TopCards extends StatelessWidget {
  const TopCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _card(
          title: 'TOTAL BETS',
          value: '155',
        ),
        SizedBox(width: 16.w),
        _card(
          title: 'WIN RATE',
          value: '55%',
        ),
      ],
    );
  }

  Widget _card({
    required String title,
    required String value,
  }) =>
      Expanded(
        child: MyActivitiesContainerWidget(
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.tertiaryBase10,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tertiary6,
                ),
              ),
            ],
          ),
        ),
      );
}

class TotalBets extends StatelessWidget {
  const TotalBets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyActivitiesContainerWidget(
      child: Column(
        children: [
          _tile(
            leading: 'Total Bets won',
            trailing: '44 Bets',
          ),
          SizedBox(height: 16.h),
          const Line(),
          SizedBox(height: 16.h),
          _tile(
            leading: 'Total Bets Loss',
            trailing: '20 Bets',
          ),
        ],
      ),
    );
  }

  Widget _tile({
    required String leading,
    required String trailing,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.tertiary8,
            ),
          ),
          Text(
            trailing,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.tertiaryBase10,
            ),
          ),
        ],
      );
}

class DepositOrWithdrawal extends StatelessWidget {
  const DepositOrWithdrawal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyActivitiesContainerWidget(
      child: Column(
        children: [
          const CardHeaderRow(
            title: 'Deposit/Withdrawal',
            amount: '4000',
          ),
          SizedBox(height: 12.h),
          const Line(),
          SizedBox(height: 12.h),
          _tile(
            title: 'Total Deposits',
            amount: '2000',
          ),
          SizedBox(height: 12.h),
          const Line(),
          SizedBox(height: 12.h),
          _tile(
            title: 'Total Withdrawals',
            amount: '2000',
          ),
        ],
      ),
    );
  }

  Widget _tile({
    required String title,
    required String amount,
  }) =>
      Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.tertiary8,
            ),
          ),
          const Spacer(),
          const CurrencySign(),
          Text(
            amount,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.tertiaryBase10,
            ),
          ),
        ],
      );
}

class DepositLimit extends StatelessWidget {
  const DepositLimit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyActivitiesContainerWidget(
      child: Column(
        children: [
          const CardHeaderRow(
            title: 'Deposit limit',
            amount: '40,000',
          ),
          SizedBox(height: 12.h),
          const Line(),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Change your deposit limit',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tertiary8,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    width: 1.h,
                    color: AppColors.primaryBase6,
                  ),
                ),
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBase6,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AmountStaked extends StatelessWidget {
  const AmountStaked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyActivitiesContainerWidget(
      child: Column(
        children: [
          const CardHeaderRow(
            title: 'Amount Staked',
            amount: '40,000',
          ),
          SizedBox(height: 12.h),
          const Line(),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'No data available yet...',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.tertiary8,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecentStakes extends StatelessWidget {
  const RecentStakes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        _header(),
        SizedBox(height: 8.h),
        StakesContainerWidget(),
      ],
    );
  }

  Widget _header() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Stakes',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.tertiaryBase10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                left: 8.w,
                right: 6.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.tertiary1,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                    color: AppColors.tertiaryBase10.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    'This week',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.tertiaryBase10,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    getSvg('arrow-down'),
                    height: 16.h,
                    width: 16.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class StakesContainerWidget extends StatelessWidget {
  StakesContainerWidget({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'red',
      },
    },
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'green',
      },
    },
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'green',
      },
    },
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'yellow',
      },
    },
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'red',
      },
    },
    {
      'name': 'Jakepunter',
      'stake': '2000',
      'outcome': {
        'amount': '2000',
        'color': 'yellow',
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return StakersTable(data: data);
  }
}

class StakersTable extends StatelessWidget {
  const StakersTable({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: MyActivitiesContainerWidget(
        isPadding: false,
        child: Column(
          children: [
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(1.2),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.h,
                        color: AppColors.tertiary3,
                      ),
                    ),
                  ),
                  children: [
                    _noText(),
                    _headerText('Stakers'),
                    _headerText('Stakes'),
                    _headerText('Outcome'),
                  ],
                ),
                for (int i = 0; i < data.length; i++)
                  TableRow(
                    decoration: BoxDecoration(
                      color:
                          i.isEven ? Colors.transparent : AppColors.tertiary2,
                    ),
                    children: [
                      _numberingText('${i + 1}'),
                      _staker(data[i]['name']),
                      _amountText(amount: data[i]['stake']),
                      _amountText(
                        amount: data[i]['outcome']['amount'],
                        colorText: data[i]['outcome']['color'],
                      ),
                    ],
                  ),
              ],
            ),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _noText() => TableCell(
        child: Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 12.h,
            left: 16.w,
          ),
          child: Text(
            'No.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
        ),
      );

  Widget _headerText(text) => TableCell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
        ),
      );

  Widget _numberingText(text) => TableCell(
        child: Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 12.h,
            left: 16.w,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: AppColors.tertiary8,
            ),
          ),
        ),
      );

  Widget _staker(text) => TableCell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Image.asset(
                getImage('user-profile'),
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 4.w),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.tertiaryBase10,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _amountText({
    required String amount,
    String? colorText,
    //Color color = AppColors.tertiaryBase10,
  }) {
    Color color = AppColors.tertiaryBase10;

    if (colorText == 'red') {
      color = AppColors.dangerBase3;
    } else if (colorText == 'yellow') {
      color = AppColors.warningBase3;
    } else if (colorText == 'green') {
      color = AppColors.successBase3;
    } else {
      color = AppColors.tertiaryBase10;
    }

    return TableCell(
      //verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            CurrencySign(
              size: 10,
              color: color,
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttons() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 24.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                left: 4.w,
                right: 8.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.tertiary3,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    getSvg('arrow-left-ios'),
                    height: 10.h,
                    width: 10.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'Prev',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.tertiary8,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '10 of 100',
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                left: 8.w,
                right: 4.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.primaryBase6,
              ),
              child: Row(
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.tertiary1,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  SvgPicture.asset(
                    getSvg('arrow-right'),
                    height: 10.h,
                    width: 10.w,
                    color: AppColors.tertiary1,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class MyActivitiesContainerWidget extends StatelessWidget {
  const MyActivitiesContainerWidget({
    Key? key,
    this.isPadding = true,
    required this.child,
  }) : super(key: key);

  final bool isPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPadding ? EdgeInsets.all(16.h) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.tertiary1,
        boxShadow: [
          BoxShadow(
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
            color: AppColors.tertiaryBase10.withOpacity(0.08),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CardHeaderRow extends StatelessWidget {
  const CardHeaderRow({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.tertiaryBase10,
          ),
        ),
        const Spacer(),
        const CurrencySign(size: 14),
        Text(
          amount,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.tertiaryBase10,
          ),
        ),
      ],
    );
  }
}
