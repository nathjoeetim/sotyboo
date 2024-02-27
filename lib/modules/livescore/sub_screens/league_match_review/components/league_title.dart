import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';

class LeagueTitle extends StatelessWidget {
  const LeagueTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Premier League',
        style: TextStyle(
            color: AppColors.tertiary9,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
      ),
      subtitle: Text(
        'England',
        style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.tertiary7,
        ),
      ),
      leading: Image.asset('assets/images/EN.png'),
      trailing: GestureDetector(
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.tertiary9,
        ),
      ),
    );
  }
}
