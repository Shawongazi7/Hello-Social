import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor for singleton
  static final AppColors _instance = AppColors._();

  factory AppColors() => _instance;

  // Blue Colors
  static Color get blue => const Color(0xFF377DFF);

  // Green Colors
  static Color get green => const Color(0xFF38CB89);

  // Yellow Colors
  static Color get yellow => const Color(0xFFFFD700);

  // Red Colors
  static Color get red => const Color(0xFFFF3D00);

  // Black Colors
  static Color get black => const Color(0xFF000000);

  static Color get black87 => Colors.black87;

  static Color get black38 => Colors.black38;

  static Color get black26 => Colors.black26;

  static Color get black45 => Colors.black45;

  static Color get black54 => Colors.black54;

  // White Colors
  static Color get white => const Color(0xFFFFFFFF);

  static Color get white54 => Colors.white54;

  static Color get white70 => Colors.white70;

  static Color get titanWhite => const Color(0xFFFCFCFF);

  static Color get whiteLilac => const Color(0xFFEDEFF9);

  static Color get whiteColorForButtonBackground =>
      const Color.fromRGBO(78, 93, 120, 0.05);

  // Grey Colors
  static Color get grey => Colors.grey;

  static Color? get grey100 => Colors.grey[100];

  // Additional Colors
  static Color get cornflowerBlue => const Color(0xFF7186EB);

  static Color get vistaBlue => const Color(0xFF8B99DF);

  static Color get lightBlue => const Color(0xFFEBF5FF);

  static Color get lightGreen => const Color(0xff38CB89);

  static Color get lightOrange => const Color(0xffFF5630);

  static Color get lightYellow => const Color(0xffFFAB00);

  //Hint Colors
  static Color get hintColor => const Color.fromRGBO(78, 93, 120, 0.6);

  static Color get textColor => const Color.fromRGBO(78, 93, 120, 1);

  static Color get sectionDivider => const Color.fromRGBO(78, 93, 120, 0.05);

  // Gradient
  static LinearGradient get whiteTransparentGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.4), // Top color
          Color.fromRGBO(255, 255, 255, 0.1), // Bottom color
        ],
      );
}
