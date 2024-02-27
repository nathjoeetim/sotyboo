import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/profile/components/custom_app_bar.dart';

import '../../../core/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.title,
    this.trailing,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: title,
              trailing: trailing,
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                color: AppColors.tertiary0,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
