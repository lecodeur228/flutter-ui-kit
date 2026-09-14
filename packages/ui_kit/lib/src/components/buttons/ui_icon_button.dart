import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../theme/ui_kit_colors.dart';

enum UiIconButtonVariant { primary, soft, outline, ghost }

enum UiIconButtonSize { sm, md, lg }

/// Bouton icône Journey — cercle, variantes Material lisibles.
class UiIconButton extends StatelessWidget {
  const UiIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.variant = UiIconButtonVariant.ghost,
    this.size = UiIconButtonSize.md,
    this.isLoading = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final UiIconButtonVariant variant;
  final UiIconButtonSize size;
  final bool isLoading;

  double get _box => switch (size) {
        UiIconButtonSize.sm => 40,
        UiIconButtonSize.md => AppSizes.buttonCompact,
        UiIconButtonSize.lg => AppSizes.buttonMd,
      };

  double get _glyph => switch (size) {
        UiIconButtonSize.sm => AppSizes.iconSm,
        UiIconButtonSize.md => AppSizes.iconMd,
        UiIconButtonSize.lg => AppSizes.iconLg,
      };

  bool get _enabled => onPressed != null && !isLoading;

  ({Color? fill, Color foreground, Color? border}) _colors(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final kit = Theme.of(context).extension<UiKitColors>();
    final muted = kit?.disabled ?? scheme.onSurfaceVariant;
    final soft = kit?.primarySoft ?? scheme.primaryContainer;

    if (!_enabled && !isLoading) {
      return switch (variant) {
        UiIconButtonVariant.primary => (fill: soft, foreground: muted, border: null),
        UiIconButtonVariant.soft => (
            fill: scheme.surfaceContainerHighest,
            foreground: muted,
            border: null,
          ),
        UiIconButtonVariant.outline => (
            fill: Colors.transparent,
            foreground: muted,
            border: scheme.outlineVariant,
          ),
        UiIconButtonVariant.ghost => (
            fill: null,
            foreground: muted,
            border: null,
          ),
      };
    }

    return switch (variant) {
      UiIconButtonVariant.primary => (
          fill: scheme.primary,
          foreground: scheme.onPrimary,
          border: null,
        ),
      UiIconButtonVariant.soft => (
          fill: soft,
          foreground: scheme.primary,
          border: null,
        ),
      UiIconButtonVariant.outline => (
          fill: Colors.transparent,
          foreground: scheme.primary,
          border: scheme.primary,
        ),
      UiIconButtonVariant.ghost => (
          fill: null,
          foreground: scheme.onSurface,
          border: null,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = _colors(context);
    final onTap = _enabled ? onPressed : null;

    final Widget child = isLoading
        ? SizedBox(
            width: _glyph,
            height: _glyph,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: colors.foreground,
            ),
          )
        : Icon(icon, size: _glyph, color: colors.foreground);

    final style = IconButton.styleFrom(
      foregroundColor: colors.foreground,
      backgroundColor: colors.fill ?? Colors.transparent,
      disabledForegroundColor: colors.foreground,
      disabledBackgroundColor: colors.fill ?? Colors.transparent,
      minimumSize: Size(_box, _box),
      fixedSize: Size(_box, _box),
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.buttonAll,
        side: colors.border != null
            ? BorderSide(color: colors.border!, width: 1.5)
            : BorderSide.none,
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
    );

    Widget button = IconButton(
      onPressed: onTap,
      style: style,
      icon: child,
      tooltip: tooltip,
    );

    if (isLoading) {
      button = AbsorbPointer(child: button);
    }

    return SizedBox(width: _box, height: _box, child: button);
  }
}
