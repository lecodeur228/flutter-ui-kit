import 'package:flutter/material.dart';

import '../../tokens/app_borders.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';

/// Décoration commune des champs Journey.
abstract final class UiInputDecoration {
  static InputDecoration of(
    BuildContext context, {
    String? hint,
    String? errorText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final base = Theme.of(context).inputDecorationTheme;

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: AppRadius.inputAll,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      hintText: hint,
      errorText: errorText,
      filled: true,
      fillColor: enabled
          ? (base.fillColor ?? scheme.surface)
          : scheme.surfaceContainerHighest.withValues(alpha: 0.6),
      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
      errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: scheme.error,
          ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: (AppSizes.input - 24) / 2,
      ),
      prefixIcon: prefixIcon == null
          ? null
          : Icon(prefixIcon, size: AppSizes.iconMd, color: scheme.onSurfaceVariant),
      suffixIcon: suffixIcon,
      border: border(scheme.outline),
      enabledBorder: border(scheme.outline),
      disabledBorder: border(scheme.outlineVariant),
      focusedBorder: border(scheme.primary, width: AppBorders.focusRing),
      errorBorder: border(scheme.error),
      focusedErrorBorder: border(scheme.error, width: AppBorders.focusRing),
    );
  }
}
