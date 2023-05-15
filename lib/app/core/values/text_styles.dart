import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';

var lightThemeData = ThemeData(
  useMaterial3: true,
  cardColor: appColors.colorPrimary.value,
  primaryColor: appColors.colorPrimary.value,
  dividerColor: AppColors.colorDevider,
  primaryTextTheme: TextTheme(
    //Label
    labelLarge: const TextStyle(
        fontSize: 16,
        color: AppColors.colorTextBlack,
        fontStyle: FontStyle.normal),
    labelMedium: const TextStyle(
        fontSize: 14,
        color: AppColors.colorTextBlack,
        fontStyle: FontStyle.normal),
    labelSmall: const TextStyle(
        fontSize: 12,
        color: AppColors.colorTextBlack,
        fontStyle: FontStyle.normal),

    ///Title

    titleSmall: const TextStyle(
        fontSize: 12,
        color: AppColors.colorTextGrey,
        fontStyle: FontStyle.normal),
    titleMedium: const TextStyle(
        fontSize: 14,
        color: AppColors.colorTextGrey,
        fontStyle: FontStyle.normal),
    titleLarge: const TextStyle(
        fontSize: 16,
        color: AppColors.colorTextGrey,
        fontStyle: FontStyle.normal),

    bodyLarge: const TextStyle(
        fontSize: 16, color: Colors.white, fontStyle: FontStyle.normal),
    bodySmall: const TextStyle(
        fontSize: 12, color: Colors.white, fontStyle: FontStyle.normal),
    bodyMedium: const TextStyle(
        fontSize: 14, color: Colors.white, fontStyle: FontStyle.normal),

    displayLarge: TextStyle(color: Colors.blueGrey[800]),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
  cardColor: const Color.fromARGB(255, 36, 35, 35),
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    titleSmall: const TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.blueGrey[300],
    ),
    displayLarge: const TextStyle(
      color: Colors.white70,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  brightness: Brightness.light,
  // bottomAppBarTheme:
  //     const BottomAppBarTheme(color: Color.fromARGB(255, 57, 57, 57)),
  // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
  //     .copyWith(background: const Color.fromARGB(255, 58, 77, 86)),
);
