import 'package:flutter/material.dart';

import '../../tokens/app_elevation.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_context.dart';

/// Conteneur surface avec padding et radius du kit.
class UiCard extends StatelessWidget {
  const UiCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.card),
    this.onTap,
    this.elevation = 0,
    this.bordered = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final int elevation;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    final colors = context.uiColors;

    final content = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardAll,
        border: bordered
            ? Border.all(color: colors.outlineVariant)
            : null,
        boxShadow: AppElevation.of(elevation),
      ),
      child: child,
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      borderRadius: AppRadius.cardAll,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.cardAll,
        child: content,
      ),
    );
  }
}
