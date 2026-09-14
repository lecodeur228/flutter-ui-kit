import 'package:flutter/material.dart';

enum UiTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// Texte aligné sur les styles typographiques du kit.
class UiText extends StatelessWidget {
  const UiText(
    this.data, {
    super.key,
    this.style = UiTextStyle.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String data;
  final UiTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final base = switch (style) {
      UiTextStyle.displayLarge => theme.displayLarge,
      UiTextStyle.displayMedium => theme.displayMedium,
      UiTextStyle.displaySmall => theme.displaySmall,
      UiTextStyle.headlineLarge => theme.headlineLarge,
      UiTextStyle.headlineMedium => theme.headlineMedium,
      UiTextStyle.headlineSmall => theme.headlineSmall,
      UiTextStyle.titleLarge => theme.titleLarge,
      UiTextStyle.titleMedium => theme.titleMedium,
      UiTextStyle.titleSmall => theme.titleSmall,
      UiTextStyle.bodyLarge => theme.bodyLarge,
      UiTextStyle.bodyMedium => theme.bodyMedium,
      UiTextStyle.bodySmall => theme.bodySmall,
      UiTextStyle.labelLarge => theme.labelLarge,
      UiTextStyle.labelMedium => theme.labelMedium,
      UiTextStyle.labelSmall => theme.labelSmall,
    };

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: base?.copyWith(color: color),
    );
  }
}
