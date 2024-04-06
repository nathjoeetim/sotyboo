import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/sportboo_snack_bar.dart';
import '../core/theme/colors.dart';


double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// get device height
double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

String getSvg(String svg) {
  return 'assets/svgs/$svg.svg';
}

String getImage(String image) {
  return 'assets/images/$image.png';
}

InputDecoration authFormFieldInputDecoration(
        {required String labelText,
        required String hintText,
        required BuildContext context,
        Widget? prefixIcon,
        Widget? suffixIcon}) =>
    InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        alignLabelWithHint: true,
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.all(14),
        labelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.tertiary6),
        hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.tertiary6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.tertiary5,
            width: 1.h,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.primaryBase6,
            width: 1.h,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.primaryBase6.withOpacity(0.24),
            width: 3.h,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.dangerBase3,
            width: 1.h,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.dangerBase3.withOpacity(0.24),
            width: 3.h,
          ),
        ));

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.primaryBase6.withOpacity(0.2),
          ),
          child: Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: AppColors.primaryBase6,
              secondRingColor: AppColors.primary3,
              size: 60,
            ),
          ),
        );
      });
}

void showSportbooLoader() {
  SmartDialog.show(builder: (_) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryBase6.withOpacity(0.2),
      ),
      child: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: AppColors.primaryBase6,
          secondRingColor: AppColors.primary3,
          size: 60,
        ),
      ),
    );
  });
}

void closeSportbooLoader() {
  SmartDialog.dismiss();
}

void showSportbooSnackBar(
  String message,
  Function(String id) onView, {
  Duration duration = const Duration(seconds: 5),
}) {
  SmartDialog.showNotify(
      alignment: Alignment.topCenter,
      msg: message,
      notifyType: NotifyType.error,
      displayTime: duration,
      builder: (_) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 5, 16, 0),

            // width: 200, height: 100,
            child: SportbooSnackBar(
              message: message,
              onView: onView,
            ),
          ),
        );
      });
}

String generateCompareOdd(
    {required List data,
    required int bookieId,
    required int marketId,
    required String label}) {
  try {
    return data.firstWhere((element) => element['bookmaker_id'] == bookieId &&
        element['market_id'] == marketId && element['label'] == label)['value'];
  } on StateError catch (e) {
    return 'N/A';
  }
}

double calculateTextHeight(
    {required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required double screenWidth,
    required Orientation orientation}) {
  final margin = 0.0;
  final padding = 10.0;

  // Calculate the available width for the text, accounting for margin and padding
  final availableWidth = screenWidth - 2 * (margin + padding);

  // Create a TextPainter to measure the text
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(maxWidth: availableWidth);

  // Calculate the height required for the text
  final textHeight = textPainter.height;

  // Calculate the total height required, accounting for margin and padding
  final totalHeight = textHeight + 2 * (margin + padding);

  // Adjust the height for landscape orientation, if needed
  if (orientation == Orientation.landscape) {
    // You may want to adjust the height differently for landscape mode.
    // For example, you can reduce the padding or margin.
    // totalHeight = textHeight + margin + padding;
  }

  return totalHeight;
}
