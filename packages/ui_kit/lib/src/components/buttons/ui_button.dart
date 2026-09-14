import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';

enum UiButtonVariant { primary, secondary, outline, ghost, destructive }

enum UiButtonSize { sm, md, lg }

/// Bouton adaptatif (liquid glass iOS 26+ / Cupertino / Material).
class UiButton extends StatelessWidget {
  const UiButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = UiButtonVariant.primary,
    this.size = UiButtonSize.md,
    this.isLoading = false,
    this.icon,
    this.expanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final UiButtonVariant variant;
  final UiButtonSize size;
  final bool isLoading;
  final IconData? icon;
  final bool expanded;

  AdaptiveButtonStyle get _style => switch (variant) {
        UiButtonVariant.primary || UiButtonVariant.destructive =>
          AdaptiveButtonStyle.filled,
        UiButtonVariant.secondary => AdaptiveButtonStyle.tinted,
        UiButtonVariant.outline => AdaptiveButtonStyle.bordered,
        UiButtonVariant.ghost => AdaptiveButtonStyle.plain,
      };

  AdaptiveButtonSize get _size => switch (size) {
        UiButtonSize.sm => AdaptiveButtonSize.small,
        UiButtonSize.md => AdaptiveButtonSize.medium,
        UiButtonSize.lg => AdaptiveButtonSize.large,
      };

  Color? _color(BuildContext context) {
    if (variant == UiButtonVariant.destructive) {
      return Theme.of(context).colorScheme.error;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;
    final color = _color(context);

    final Widget button;
    if (isLoading) {
      button = AdaptiveButton.child(
        onPressed: null,
        enabled: false,
        style: _style,
        size: _size,
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: AppSizes.iconSm,
              height: AppSizes.iconSm,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(label),
          ],
        ),
      );
    } else if (icon != null) {
      button = AdaptiveButton.child(
        onPressed: enabled ? onPressed : null,
        enabled: enabled,
        style: _style,
        size: _size,
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSizes.iconMd),
            const SizedBox(width: AppSpacing.sm),
            Text(label),
          ],
        ),
      );
    } else {
      button = AdaptiveButton(
        onPressed: enabled ? onPressed : null,
        enabled: enabled,
        label: label,
        style: _style,
        size: _size,
        color: color,
      );
    }

    if (!expanded) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}
