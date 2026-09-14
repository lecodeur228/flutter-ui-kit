import 'package:flutter/material.dart';

/// Palette Journey — covoiturage (vert route + marine confiance).
abstract final class AppColors {
  // —— Brand light ——
  static const Color primary = Color(0xFF0D9F6E);
  static const Color primaryPressed = Color(0xFF0B7F58);
  static const Color primarySoft = Color(0xFFD8F5EA);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = primarySoft;

  static const Color secondary = Color(0xFF1E3A5F);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFD6E4F5);

  // —— Brand dark ——
  static const Color primaryDark = Color(0xFF3DDBA0);
  static const Color primaryPressedDark = Color(0xFF0D9F6E);
  static const Color primarySoftDark = Color(0xFF0A3D2E);
  static const Color onPrimaryDark = Color(0xFF052E1C);
  static const Color primaryContainerDark = primarySoftDark;

  static const Color secondaryDark = Color(0xFF8BB4E0);
  static const Color onSecondaryDark = Color(0xFF0B1A2C);
  static const Color secondaryContainerDark = Color(0xFF1A2F4A);

  // —— Surfaces light ——
  static const Color backgroundLight = Color(0xFFF4F7F5);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFE8F0EC);
  static const Color onSurfaceLight = Color(0xFF0C1A14);
  static const Color onSurfaceVariantLight = Color(0xFF5C6B64);

  // —— Surfaces dark ——
  static const Color backgroundDark = Color(0xFF0A0F0D);
  static const Color surfaceDark = Color(0xFF121A17);
  static const Color surfaceVariantDark = Color(0xFF1A2420);
  static const Color onSurfaceDark = Color(0xFFE8F0EC);
  static const Color onSurfaceVariantDark = Color(0xFF9AABA3);

  // —— Feedback light ——
  static const Color error = Color(0xFFE04B4B);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color success = primary;
  static const Color onSuccess = onPrimary;
  static const Color warning = Color(0xFFE8A317);
  static const Color onWarning = Color(0xFF1A1305);
  static const Color info = secondary;
  static const Color onInfo = onSecondary;

  // —— Feedback dark ——
  static const Color errorDark = Color(0xFFF07171);
  static const Color onErrorDark = Color(0xFF2A0A0A);
  static const Color successDark = primaryDark;
  static const Color onSuccessDark = onPrimaryDark;
  static const Color warningDark = Color(0xFFF0C14A);
  static const Color onWarningDark = Color(0xFF1A1305);
  static const Color infoDark = secondaryDark;
  static const Color onInfoDark = onSecondaryDark;

  // —— Traits ——
  static const Color outlineLight = Color(0xFFD5E0DA);
  static const Color outlineVariantLight = Color(0xFFE4EDE8);
  static const Color outlineDark = Color(0xFF24302B);
  static const Color outlineVariantDark = Color(0xFF1A2420);
  static const Color dividerLight = Color(0xFFD5E0DA);
  static const Color dividerDark = Color(0xFF24302B);
  static const Color scrim = Color(0x99000000);

  // —— États ——
  static const Color disabledLight = Color(0xFF9AABA3);
  static const Color disabledDark = Color(0xFF5C6B64);
}
