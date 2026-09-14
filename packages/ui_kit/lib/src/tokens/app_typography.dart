import 'package:flutter/material.dart';

/// Typographie Material 3 alignée sur le kit (famille système par défaut).
abstract final class AppTypography {
  static const String? fontFamily = null;

  static TextTheme textTheme({Color? color}) {
    TextStyle base(double size, FontWeight weight, double height) {
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
        height: height,
        color: color,
        letterSpacing: 0,
      );
    }

    return TextTheme(
      displayLarge: base(57, FontWeight.w400, 1.12),
      displayMedium: base(45, FontWeight.w400, 1.16),
      displaySmall: base(36, FontWeight.w400, 1.22),
      headlineLarge: base(32, FontWeight.w600, 1.25),
      headlineMedium: base(28, FontWeight.w600, 1.29),
      headlineSmall: base(24, FontWeight.w600, 1.33),
      titleLarge: base(22, FontWeight.w600, 1.27),
      titleMedium: base(16, FontWeight.w600, 1.5),
      titleSmall: base(14, FontWeight.w600, 1.43),
      bodyLarge: base(16, FontWeight.w400, 1.5),
      bodyMedium: base(14, FontWeight.w400, 1.43),
      bodySmall: base(12, FontWeight.w400, 1.33),
      labelLarge: base(14, FontWeight.w600, 1.43),
      labelMedium: base(12, FontWeight.w600, 1.33),
      labelSmall: base(11, FontWeight.w600, 1.45),
    );
  }
}
