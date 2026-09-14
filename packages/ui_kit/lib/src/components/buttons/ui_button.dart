import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_colors.dart';

enum UiButtonVariant { primary, secondary, outline, ghost, destructive }

enum UiButtonSize { sm, md, lg }

/// Bouton Journey — pill, variantes Material, états loading / disabled distincts.
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

  bool get _isDisabled => onPressed == null && !isLoading;
  bool get _isInteractive => onPressed != null && !isLoading;

  double get _height => switch (size) {
        UiButtonSize.sm => AppSizes.buttonSm,
        UiButtonSize.md => AppSizes.buttonMd,
        UiButtonSize.lg => AppSizes.buttonLg,
      };

  double get _iconSize => switch (size) {
        UiButtonSize.sm => AppSizes.iconSm,
        UiButtonSize.md => AppSizes.iconMd,
        UiButtonSize.lg => AppSizes.iconLg,
      };

  EdgeInsets get _padding => switch (size) {
        UiButtonSize.sm => const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        UiButtonSize.md => const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        UiButtonSize.lg => const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      };

  /// Couleurs selon variante + état (loading ≠ disabled).
  ({Color? fill, Color foreground, Color? border}) _colors(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final kit = Theme.of(context).extension<UiKitColors>();
    final muted = kit?.disabled ?? scheme.onSurfaceVariant;
    final soft = kit?.primarySoft ?? scheme.primaryContainer;

    if (_isDisabled) {
      return switch (variant) {
        UiButtonVariant.primary || UiButtonVariant.destructive => (
            fill: soft,
            foreground: muted,
            border: null,
          ),
        UiButtonVariant.secondary => (
            fill: scheme.surfaceContainerHighest,
            foreground: muted,
            border: null,
          ),
        UiButtonVariant.outline => (
            fill: Colors.transparent,
            foreground: muted,
            border: scheme.outlineVariant,
          ),
        UiButtonVariant.ghost => (
            fill: null,
            foreground: muted,
            border: null,
          ),
      };
    }

    // Loading + normal : même palette “active” (loading reste lisible).
    return switch (variant) {
      UiButtonVariant.primary => (
          fill: scheme.primary,
          foreground: scheme.onPrimary,
          border: null,
        ),
      UiButtonVariant.secondary => (
          fill: soft,
          foreground: scheme.primary,
          border: null,
        ),
      UiButtonVariant.outline => (
          fill: Colors.transparent,
          foreground: scheme.primary,
          border: scheme.primary,
        ),
      UiButtonVariant.ghost => (
          fill: null,
          foreground: scheme.primary,
          border: null,
        ),
      UiButtonVariant.destructive => (
          fill: scheme.error,
          foreground: scheme.onError,
          border: null,
        ),
    };
  }

  Widget _content(BuildContext context, Color foreground) {
    final labelStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        );

    if (isLoading) {
      final labelWidget = Text(
        label,
        style: labelStyle,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: foreground,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          if (expanded) Flexible(child: labelWidget) else labelWidget,
        ],
      );
    }

    final text = Text(
      label,
      style: labelStyle,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Icon(icon, size: _iconSize, color: foreground),
          const SizedBox(width: AppSpacing.xs),
          if (expanded) Flexible(child: text) else text,
        ],
      );
    }
    return text;
  }

  OutlinedBorder get _shape =>
      const RoundedRectangleBorder(borderRadius: AppRadius.buttonAll);

  @override
  Widget build(BuildContext context) {
    final colors = _colors(context);
    final content = _content(context, colors.foreground);
    final onTap = _isInteractive ? onPressed : null;

    // Loading : onPressed null mais styles “actifs” (pas disabled Material).
    final ButtonStyle base = ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(expanded ? double.infinity : 0, _height),
      ),
      padding: WidgetStateProperty.all(_padding),
      shape: WidgetStateProperty.all(_shape),
      elevation: WidgetStateProperty.all(0),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      textStyle: WidgetStateProperty.all(
        Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      // Force nos couleurs même si Material considère le bouton disabled.
      backgroundColor: colors.fill != null
          ? WidgetStateProperty.all(colors.fill)
          : WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.all(colors.foreground),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (!_isInteractive) return Colors.transparent;
        if (states.contains(WidgetState.pressed)) {
          return colors.foreground.withValues(alpha: 0.12);
        }
        return null;
      }),
      side: colors.border != null
          ? WidgetStateProperty.all(
              BorderSide(color: colors.border!, width: 1.5),
            )
          : WidgetStateProperty.all(BorderSide.none),
    );

    final Widget button = switch (variant) {
      UiButtonVariant.primary ||
      UiButtonVariant.destructive ||
      UiButtonVariant.secondary =>
        FilledButton(
          onPressed: onTap,
          style: base,
          child: content,
        ),
      UiButtonVariant.outline => OutlinedButton(
          onPressed: onTap,
          style: base,
          child: content,
        ),
      UiButtonVariant.ghost => TextButton(
          onPressed: onTap,
          style: base,
          child: content,
        ),
    };

    final wrapped = expanded
        ? SizedBox(width: double.infinity, height: _height, child: button)
        : button;

    if (!isLoading) return wrapped;

    // Empêche les taps pendant le loading tout en gardant le style actif.
    return AbsorbPointer(child: wrapped);
  }
}
