import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typographie Journey — Plus Jakarta Sans.
abstract final class AppTypography {
  static String get fontFamily =>
      GoogleFonts.plusJakartaSans().fontFamily ?? 'Plus Jakarta Sans';

  static TextTheme textTheme({Color? color}) {
    TextStyle style({
      required double size,
      required FontWeight weight,
      double height = 1.2,
      double? letterSpacing,
    }) {
      return GoogleFonts.plusJakartaSans(
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: letterSpacing ?? _letterSpacingFor(size),
        color: color,
      );
    }

    return TextTheme(
      displayLarge: style(size: 57, weight: FontWeight.w700, letterSpacing: -0.5),
      displayMedium: style(size: 45, weight: FontWeight.w700, letterSpacing: -0.5),
      displaySmall: style(size: 36, weight: FontWeight.w700),
      headlineLarge: style(size: 32, weight: FontWeight.w700),
      headlineMedium: style(size: 28, weight: FontWeight.w700),
      headlineSmall: style(size: 24, weight: FontWeight.w600),
      titleLarge: style(size: 22, weight: FontWeight.w600),
      titleMedium: style(size: 16, weight: FontWeight.w600),
      titleSmall: style(size: 14, weight: FontWeight.w600),
      bodyLarge: style(size: 16, weight: FontWeight.w400, height: 1.45),
      bodyMedium: style(size: 14, weight: FontWeight.w400, height: 1.45),
      bodySmall: style(size: 12, weight: FontWeight.w400, height: 1.4),
      labelLarge: style(size: 14, weight: FontWeight.w600),
      labelMedium: style(size: 12, weight: FontWeight.w600),
      labelSmall: style(size: 11, weight: FontWeight.w500),
    );
  }

  static double _letterSpacingFor(double size) {
    if (size >= 28) return -0.3;
    if (size >= 20) return -0.2;
    return 0;
  }
}
