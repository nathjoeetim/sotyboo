import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';

class MyExpansionTile extends StatefulWidget {
  const MyExpansionTile({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: AppColors.tertiary2,
      collapsedBackgroundColor: AppColors.tertiary2,
      shape: Border.all(width: 0),
      collapsedShape: Border(
        bottom: BorderSide(
          color: AppColors.tertiary3,
          width: 1.h,
        ),
      ),
      tilePadding: EdgeInsets.symmetric(horizontal: 16.h),
      title: Text(
        widget.title,
        style: TextStyle(
          color: AppColors.tertiaryBase10,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
      ),
      trailing: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
            child: SvgPicture.asset(
              'assets/svgs/arrow-down-thin.svg',
              width: 16.w,
              height: 16.w,
              color: isExpanded ? AppColors.primaryBase6 : AppColors.tertiary8,
            ),
          );
        },
      ),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
        if (value) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      children: widget.children,
    );
  }
}
