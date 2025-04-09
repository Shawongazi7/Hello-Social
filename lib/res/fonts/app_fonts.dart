import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._(); // Private constructor for singleton
  static final AppFonts _instance = AppFonts._();

  factory AppFonts() => _instance;

  // Font names (ensure these match the names in your pubspec.yaml)
  static const String robotoRegular = 'Roboto-Regular';
  static const String robotoBold = 'Roboto-Bold';

  // Getters for text styles
  static TextStyle get heading1Black => const TextStyle(
        fontSize: 30.0,
        height: 46.0 / 30.0,
        fontWeight: FontWeight.w900,
        fontFamily: robotoBold,
      );

  static TextStyle get heading2Bold => const TextStyle(
        fontSize: 26.0,
        height: 40.0 / 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: robotoBold,
      );

  static TextStyle get heading3Bold => const TextStyle(
        fontSize: 18.0,
        height: 28.0 / 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: robotoBold,
      );

  static TextStyle get displayBold => const TextStyle(
        fontSize: 16.0,
        height: 24.0 / 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: robotoBold,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontSize: 16.0,
        height: 24.0 / 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: robotoRegular,
      );

  static TextStyle get bodyBold => const TextStyle(
        fontSize: 14.0,
        height: 22.0 / 14.0,
        fontWeight: FontWeight.bold,
        fontFamily: robotoBold,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 14.0,
        height: 22.0 / 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: robotoRegular,
      );

  static TextStyle get bodyRegular => const TextStyle(
        fontSize: 14.0,
        height: 22.0 / 14.0,
        fontWeight: FontWeight.normal,
        fontFamily: robotoRegular,
      );

  static TextStyle get bodyMedium13 => const TextStyle(
        fontSize: 13.0,
        height: 18.0 / 13.0,
        fontWeight: FontWeight.w500,
        fontFamily: robotoRegular,
      );

  static TextStyle get bodyRegular12 => const TextStyle(
        fontSize: 12.0,
        height: 18.0 / 12.0,
        fontWeight: FontWeight.normal,
        fontFamily: robotoRegular,
      );

  static TextStyle get bodyRegular10 => const TextStyle(
        fontSize: 10.0,
        height: 16.0 / 10.0,
        fontWeight: FontWeight.normal,
        fontFamily: robotoRegular,
      );
}
