import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const ROUNDED_RECTANGLE_BORDER = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)));

class AppPadding {
  static const EdgeInsets allSmall = EdgeInsets.all(8.0);
  static const EdgeInsets allMedium = EdgeInsets.all(16.0);
  static const EdgeInsets allLarge = EdgeInsets.all(24.0);

  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: 24.0);

  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24.0);
}

class AppColor {
  // static const Color lightPurple = Color(0xFF
  static const Color darkPurple = Color(0xFF2A1E39);
  static const Color deepPurple = Color(0xFF420085);
  static const Color medPurple = Color(0xFFA448FF);
  static const Color lightPurple = Color(0xFF736B7C);

  static const Color darkGreen = Color(0xFF003928);
  static const Color medGreen = Color(0xFF48A388);
  static const Color lightGreen = Color(0xFFA9EACE);
  static const Color lightRed = Color(0xFFFF9A98);
  static const Color lightYellow = Color(0xFFFEFEC1);

  static const Color white = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const TextStyle displayLarge = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: AppColor.darkPurple);
  static const TextStyle displayMedium = TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: AppColor.deepPurple);
  static const TextStyle displaySmall = TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: AppColor.darkPurple);
  
  static const TextStyle headlineLarge = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: AppColor.darkPurple);
  static const TextStyle headlineMedium = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColor.deepPurple);
  static const TextStyle headlineSmall = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColor.medPurple);
  
  static const TextStyle titleLarge = TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: AppColor.darkPurple);
  static const TextStyle titleMedium = TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: AppColor.deepPurple);
  static const TextStyle titleSmall = TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColor.medPurple);
  
  static const TextStyle bodyLarge = TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: AppColor.deepPurple);
  static const TextStyle bodyMedium = TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColor.medPurple);
  static const TextStyle bodySmall = TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: AppColor.lightPurple);
  
  static const TextStyle labelLarge = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColor.deepPurple);
  static const TextStyle labelMedium = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: AppColor.medPurple);
  static const TextStyle labelSmall = TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: AppColor.lightPurple);
}

class AppGaps {
  static const Widget smallGap = SizedBox(height: 8);
  static const Widget medGap = SizedBox(height: 16);
  static const Widget largeGap = SizedBox(height: 24);
  static const Widget hugeGap = SizedBox(height: 32);
}

class AppSizes {
  static const double spaceXS = 4.0;
  static const double spaceSmall = 8.0;
  static const double spaceMedium = 16.0;
  static const double spaceLarge = 24.0;
  static const double spaceXL = 32.0;
  
  static const double iconSizeSmall = 18.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  static const double cardElevation = 2.0;
  static const double borderRadius = 10.0;
  static const double lineHeight = 1.5; // Line height for text
}

class AppBorderRadius {
  static const BorderRadius small = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(24.0));

  // Specific for cards, buttons, etc.
  static const BorderRadius card = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius button = BorderRadius.all(Radius.circular(8.0));
}

