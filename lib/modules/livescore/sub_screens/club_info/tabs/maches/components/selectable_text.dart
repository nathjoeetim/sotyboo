import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/colors.dart';

enum Selection { fixtures, results }

class SelectableTextContainer extends StatefulWidget {
  const SelectableTextContainer({super.key});

  @override
  _SelectableTextContainerState createState() =>
      _SelectableTextContainerState();
}

class _SelectableTextContainerState extends State<SelectableTextContainer> {
  Selection selectedText = Selection.fixtures;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = Selection.fixtures;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                selectedText == Selection.fixtures
                    ? BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(
                            0, 3), // changes the position of the shadow
                      )
                    : const BoxShadow(color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(24),
              color: selectedText == Selection.fixtures
                  ? AppColors.tertiary1
                  : AppColors.tertiary2,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              'Fixtures',
              style: TextStyle(
                  color: selectedText == Selection.fixtures
                      ? AppColors.primaryBase6
                      : AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedText = Selection.results;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                selectedText == Selection.results
                    ? BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(
                            0, 3), // changes the position of the shadow
                      )
                    : const BoxShadow(color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(24),
              color: selectedText == Selection.results
                  ? AppColors.tertiary1
                  : AppColors.tertiary2,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              'Results',
              style: TextStyle(
                  color: selectedText == Selection.results
                      ? AppColors.primaryBase6
                      : AppColors.tertiary8,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
