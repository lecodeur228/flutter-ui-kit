import 'package:flutter/material.dart';

import '../tokens/app_borders.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_sizes.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';
import 'ui_kit_colors.dart';

/// Thèmes light / dark du design system.
abstract final class UiKitTheme {
  static ThemeData get light => _build(
        brightness: Brightness.light,
        kitColors: UiKitColors.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.surfaceLight,
          onSurface: AppColors.onSurfaceLight,
          onSurfaceVariant: AppColors.onSurfaceVariantLight,
          outline: AppColors.outlineLight,
          outlineVariant: AppColors.outlineVariantLight,
          scrim: AppColors.scrim,
        ),
        scaffoldBackground: AppColors.backgroundLight,
      );

  static ThemeData get dark => _build(
        brightness: Brightness.dark,
        kitColors: UiKitColors.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: Color(0xFF1A3A6E),
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark,
          onSurfaceVariant: AppColors.onSurfaceVariantDark,
          outline: AppColors.outlineDark,
          outlineVariant: AppColors.outlineVariantDark,
          scrim: AppColors.scrim,
        ),
        scaffoldBackground: AppColors.backgroundDark,
      );

  static ThemeData _build({
    required Brightness brightness,
    required UiKitColors kitColors,
    required ColorScheme colorScheme,
    required Color scaffoldBackground,
  }) {
    final textTheme = AppTypography.textTheme(color: colorScheme.onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[kitColors],
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: scaffoldBackground,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonMd),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonMd),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          side: BorderSide(color: colorScheme.outline, width: AppBorders.hairline),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonMd),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.inputAll,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputAll,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputAll,
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: AppBorders.focusRing,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputAll,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputAll,
          borderSide: BorderSide(
            color: colorScheme.error,
            width: AppBorders.focusRing,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardAll,
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(
        color: kitColors.divider,
        thickness: AppBorders.hairline,
        space: AppBorders.hairline,
      ),
    );
  }
}
