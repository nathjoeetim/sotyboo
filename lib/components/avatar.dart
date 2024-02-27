import 'package:flutter/material.dart';

import '../core/theme/colors.dart';

enum AvatarType { thick, thin }

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.radius,
    this.avatarType = AvatarType.thick,
    this.thickBorderColor,
  });
  final double radius;
  final AvatarType avatarType;
  final Color? thickBorderColor;

  @override
  Widget build(BuildContext context) {
    if (avatarType == AvatarType.thick) {
      return CircleAvatar(
        backgroundColor: thickBorderColor ?? AppColors.tertiaryBase10,
        radius: radius,
        child: CircleAvatar(
          radius: radius - 2,
          backgroundColor: AppColors.tertiaryTint4,
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: AppColors.tertiary8,
        radius: radius,
        child: CircleAvatar(
          radius: radius - 1,
          backgroundColor: AppColors.tertiaryTint3,
        ),
      );
    }
  }
}
