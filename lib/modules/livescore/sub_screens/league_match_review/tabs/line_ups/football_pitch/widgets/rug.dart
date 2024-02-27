import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/colors.dart';

class Rugs extends StatelessWidget {
  const Rugs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 60.h,
          width: double.maxFinite,
          color: index.isEven ? AppColors.pitch2 : AppColors.pitch,
        );
      },
    );
  }
}
