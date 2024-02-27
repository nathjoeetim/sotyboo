import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class BorderBox extends StatelessWidget {
  const BorderBox({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.radius,
  });

  final Widget child;
  final Color? color;
  final double? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        padding ?? 2,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.tertiary3,
        borderRadius: BorderRadius.circular(radius ?? 24),
      ),
      child: child,
    );
  }
}
