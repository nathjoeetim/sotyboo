import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appLightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryBase6
  ),
    primaryColor: AppColors.primaryBase6,
    scaffoldBackgroundColor: AppColors.tertiary1,
    primaryColorLight: AppColors.primary3,
    cardColor: AppColors.tertiary1,
    primaryIconTheme: const IconThemeData().copyWith(
      color: AppColors.primaryBase6,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.tertiary8,
      elevation: 0,
    ),
    iconTheme:
        const IconThemeData().copyWith(color: AppColors.primaryBase6, size: 24),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.tertiary1,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: AppColors.tertiary6,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 61,
        fontWeight: FontWeight.w700,
        color: AppColors.tertiaryBase10,
      ),
      displayMedium: TextStyle(
        fontSize: 49,
        fontWeight: FontWeight.w600,
        color: AppColors.tertiaryBase10,
      ),
      displaySmall: TextStyle(
        fontSize: 39,
        fontWeight: FontWeight.w600,
        color: AppColors.tertiaryBase10,
      ),
      headlineMedium: TextStyle(
        fontSize: 31,
        fontWeight: FontWeight.w500,
        color: AppColors.tertiaryBase10,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.tertiaryBase10,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.tertiaryBase10,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.tertiary8,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.tertiaryBase10,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.tertiary8,
      ),
      labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.tertiary8,
          letterSpacing: 0.4),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.tertiary1,
      ),
    ).apply(
      fontFamily: 'inter',
    ));
