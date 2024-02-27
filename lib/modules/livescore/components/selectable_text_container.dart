import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

enum SelectableType { standardGreenText, standardWhiteText, search, favourite }

class SelectableTextContainer extends StatelessWidget {
  const SelectableTextContainer({
    Key? key,
    required this.texts,
    required this.selectedText,
    this.selectableType = SelectableType.standardWhiteText,
    required this.onPressed,
  }) : super(key: key);

  final List<String> texts;
  final String selectedText;
  final SelectableType selectableType;
  final ValueChanged<String> onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: texts.map((text) {
        final isSelected = text == selectedText;

        String displayText = text.toUpperCase();

        late Color color;
        Color textColor =
            isSelected ? AppColors.tertiary1 : AppColors.tertiary8;

        EdgeInsetsGeometry margin = EdgeInsets.only(right: 16.w);
        EdgeInsetsGeometry padding = EdgeInsets.all(8.h);

        List<BoxShadow> boxShadow = const [
          BoxShadow(color: Colors.transparent)
        ];

        Border border = const Border();

        switch (selectableType) {
          case SelectableType.standardGreenText:
            textColor =
                isSelected ? AppColors.primaryBase6 : AppColors.tertiary8;
            color = isSelected ? AppColors.tertiary1 : Colors.transparent;

            boxShadow = isSelected
                ? [
                    BoxShadow(
                      color: AppColors.tertiaryBase10.withOpacity(0.08),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ]
                : const [BoxShadow(color: Colors.transparent)];

            break;

          case SelectableType.standardWhiteText:
            color = isSelected ? AppColors.primaryBase6 : AppColors.tertiary3;
            break;

          case SelectableType.search:
            displayText = text.toLowerCase();
            displayText = text.capitalizeFirst!;
            color = isSelected ? AppColors.primaryBase6 : AppColors.tertiary2;

            margin = EdgeInsets.only(right: 8.w);
            padding = EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 16.w,
            );

            border = isSelected
                ? const Border()
                : Border.all(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  );

            break;

          case SelectableType.favourite:
            color = isSelected ? AppColors.primaryBase6 : Colors.transparent;

            padding = EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            );

            break;

          default:
        }

        return GestureDetector(
          onTap: () => onPressed(text),
          child: Container(
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(24.r),
              color: color,
              border: border,
            ),
            child: Text(
              displayText,
              style: TextStyle(
                color: textColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
