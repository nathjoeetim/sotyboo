import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: 24.w,
          height: 24.h,
          child: SvgPicture.asset('assets/svgs/arrow-left.svg'),
        ),
      ),
    );
  }
}
