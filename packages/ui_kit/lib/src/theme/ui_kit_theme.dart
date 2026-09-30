import 'package:flutter/material.dart';

import '../tokens/app_borders.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_sizes.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_typography.dart';
import 'ui_kit_colors.dart';

/// Thèmes light / dark — presets Journey + factory multi-marque.
abstract final class UiKitTheme {
  /// Preset Journey (Share Your Journey).
  static ThemeData get light => from(
        brightness: Brightness.light,
        kitColors: UiKitColors.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
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

  /// Preset Journey dark.
  static ThemeData get dark => from(
        brightness: Brightness.dark,
        kitColors: UiKitColors.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimaryDark,
          primaryContainer: AppColors.primaryContainerDark,
          secondary: AppColors.secondaryDark,
          onSecondary: AppColors.onSecondaryDark,
          secondaryContainer: AppColors.secondaryContainerDark,
          error: AppColors.errorDark,
          onError: AppColors.onErrorDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark,
          onSurfaceVariant: AppColors.onSurfaceVariantDark,
          outline: AppColors.outlineDark,
          outlineVariant: AppColors.outlineVariantDark,
          scrim: AppColors.scrim,
        ),
        scaffoldBackground: AppColors.backgroundDark,
      );

  /// Construit un [ThemeData] ui_kit à partir d'une marque custom.
  ///
  /// Les presets [light] / [dark] délèguent ici. Les apps multi-marque
  /// (ex. Rede) passent leur [ColorScheme], [UiKitColors] et optionnellement
  /// une [TextTheme] / [fontFamily] (Inter, etc.).
  static ThemeData from({
    required Brightness brightness,
    required UiKitColors kitColors,
    required ColorScheme colorScheme,
    required Color scaffoldBackground,
    TextTheme? textTheme,
    String? fontFamily,
  }) {
    var resolvedTextTheme =
        textTheme ?? AppTypography.textTheme(color: colorScheme.onSurface);
    if (fontFamily != null) {
      resolvedTextTheme = resolvedTextTheme.apply(fontFamily: fontFamily);
    }
    final resolvedFontFamily = fontFamily ?? AppTypography.fontFamily;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: resolvedTextTheme,
      fontFamily: resolvedFontFamily,
      extensions: <ThemeExtension<dynamic>>[kitColors],
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: scaffoldBackground,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: resolvedTextTheme.titleMedium?.copyWith(fontSize: 18),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonMd),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          textStyle: resolvedTextTheme.labelLarge,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonMd),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          side: BorderSide(color: colorScheme.outline, width: AppBorders.hairline),
          textStyle: resolvedTextTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, AppSizes.buttonCompact),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.buttonAll),
          textStyle: resolvedTextTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
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
