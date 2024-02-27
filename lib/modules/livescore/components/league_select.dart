import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class LeagueSelect extends StatelessWidget {
  const LeagueSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.tertiary2,
      title: Text(
        'Premier League',
        style: TextStyle(
          color: AppColors.tertiary9,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/EN.png'),
          const Icon(
            Icons.arrow_drop_down_sharp,
            color: AppColors.tertiaryBase10,
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(
          'assets/svgs/arrow-right.svg',
          color: AppColors.tertiary9,
        ),
      ),
    );
  }
}
