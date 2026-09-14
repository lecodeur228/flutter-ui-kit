import 'package:flutter/material.dart';

/// Palette sémantique du design system (valeurs brutes light/dark).
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF1B6EF3);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFD6E4FF);
  static const Color secondary = Color(0xFF5B6B7C);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // Surfaces — light
  static const Color backgroundLight = Color(0xFFF7F8FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFEEF1F5);
  static const Color onSurfaceLight = Color(0xFF12161C);
  static const Color onSurfaceVariantLight = Color(0xFF5A6572);

  // Surfaces — dark
  static const Color backgroundDark = Color(0xFF0E1116);
  static const Color surfaceDark = Color(0xFF171B22);
  static const Color surfaceVariantDark = Color(0xFF232933);
  static const Color onSurfaceDark = Color(0xFFF2F4F7);
  static const Color onSurfaceVariantDark = Color(0xFFA8B0BB);

  // Feedback
  static const Color error = Color(0xFFD92D20);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF12B76A);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFF79009);
  static const Color onWarning = Color(0xFF1A1305);
  static const Color info = Color(0xFF0BA5EC);
  static const Color onInfo = Color(0xFFFFFFFF);

  // Traits
  static const Color outlineLight = Color(0xFFD0D5DD);
  static const Color outlineVariantLight = Color(0xFFE4E7EC);
  static const Color outlineDark = Color(0xFF3A424E);
  static const Color outlineVariantDark = Color(0xFF2A313C);
  static const Color dividerLight = Color(0xFFE4E7EC);
  static const Color dividerDark = Color(0xFF2A313C);
  static const Color scrim = Color(0x99000000);

  // États
  static const Color disabledLight = Color(0xFF98A2B3);
  static const Color disabledDark = Color(0xFF667085);
}
