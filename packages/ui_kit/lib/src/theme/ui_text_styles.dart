import 'package:flutter/material.dart';

/// Styles sémantiques Journey — préférer ces getters aux `fontSize` en dur.
extension UiTextStyles on BuildContext {
  TextTheme get _text => Theme.of(this).textTheme;
  ColorScheme get _colors => Theme.of(this).colorScheme;

  TextStyle get textAppBar =>
      Theme.of(this).appBarTheme.titleTextStyle ?? _text.titleMedium!;

  TextStyle get textSection => _text.titleMedium!;

  TextStyle get textCardTitle => _text.titleSmall!;

  TextStyle get textBody => _text.bodyLarge!;

  TextStyle get textBodySecondary => _text.bodyMedium!.copyWith(
        color: _colors.onSurfaceVariant,
      );

  TextStyle get textCaption => _text.bodySmall!.copyWith(
        color: _colors.onSurfaceVariant,
      );

  TextStyle get textButton => _text.labelLarge!;

  TextStyle get textBadge => _text.labelSmall!;

  TextStyle get textHero => _text.headlineMedium!;

  TextStyle get textKpi => _text.headlineSmall!;

  TextStyle get textPrice => _text.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get textEmptyStateTitle => _text.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: _colors.onSurface,
      );

  TextStyle get textValue => _text.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600,
        color: _colors.onSurface,
      );

  TextStyle get textLabel => _text.bodyMedium!.copyWith(
        color: _colors.onSurfaceVariant,
      );

  TextStyle get textDialogTitle => _text.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
        color: _colors.onSurface,
      );
}
