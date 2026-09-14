import 'package:flutter/material.dart';

import '../../tokens/app_opacity.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_context.dart';

enum UiButtonVariant { primary, secondary, outline, ghost, destructive }

enum UiButtonSize { sm, md, lg }

/// Bouton standard du design system.
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

  double get _height => switch (size) {
        UiButtonSize.sm => AppSizes.buttonSm,
        UiButtonSize.md => AppSizes.buttonMd,
        UiButtonSize.lg => AppSizes.buttonLg,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.uiColors;
    final enabled = onPressed != null && !isLoading;

    final (Color bg, Color fg, BorderSide? side) = switch (variant) {
      UiButtonVariant.primary => (colors.primary, colors.onPrimary, null),
      UiButtonVariant.secondary => (
          colors.secondary,
          colors.onSecondary,
          null,
        ),
      UiButtonVariant.outline => (
          Colors.transparent,
          colors.primary,
          BorderSide(color: colors.outline),
        ),
      UiButtonVariant.ghost => (Colors.transparent, colors.primary, null),
      UiButtonVariant.destructive => (colors.error, colors.onError, null),
    };

    final child = Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: AppSizes.iconSm,
            height: AppSizes.iconSm,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: fg,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ] else if (icon != null) ...[
          Icon(icon, size: AppSizes.iconMd, color: fg),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(label, style: context.uiText.labelLarge?.copyWith(color: fg)),
      ],
    );

    return Opacity(
      opacity: enabled ? 1 : AppOpacity.disabled,
      child: Material(
        color: bg,
        borderRadius: AppRadius.buttonAll,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: AppRadius.buttonAll,
          child: Container(
            height: _height,
            width: expanded ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            decoration: side == null
                ? null
                : BoxDecoration(
                    borderRadius: AppRadius.buttonAll,
                    border: Border.fromBorderSide(side),
                  ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
