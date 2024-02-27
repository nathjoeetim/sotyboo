import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum OddsType {
  x12,
  homeAway,
  overUnder,
  asianHandicap,
  europeanHandicap,
  doubleChance,
  halfTimeFullTime,
  correctScore,
  oddEven,
  bothTeamsToScore,
}

class OddsContainer extends StatefulWidget {
  const OddsContainer({Key? key, required this.onChipPressed})
      : super(key: key);

  final Function(OddsType) onChipPressed;

  @override
  _OddsContainerState createState() => _OddsContainerState();
}

class _OddsContainerState extends State<OddsContainer> {
  OddsType selectedOddsType = OddsType.x12;

  List<String> odds = [
    '1X2',
    'HOME/AWAY',
    'O/U',
    'AH',
    'EH',
    'DC',
    'HT/FT',
    'CS',
    'O/E',
    'BTS',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      color: AppColors.tertiary1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              odds.length, (index) => _oddsDigit(odds[index], index)),
        ),
      ),
    );
  }

  Widget _oddsDigit(String oddsText, int index) {
    final oddsType = OddsType.values[index];
    final isSelected = selectedOddsType == oddsType;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOddsType = oddsType;
        });

        widget.onChipPressed(oddsType);
      },
      child: Container(
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isSelected ? AppColors.primaryBase6 : AppColors.tertiary3,
        ),
        child: Text(
          oddsText,
          style: TextStyle(
            color: isSelected ? AppColors.tertiary1 : AppColors.tertiary8,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
