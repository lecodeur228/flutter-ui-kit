import 'package:flutter/material.dart';

import '../../tokens/app_opacity.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../theme/ui_kit_context.dart';

/// Bouton icône du design system.
class UiIconButton extends StatelessWidget {
  const UiIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size = AppSizes.buttonMd,
    this.iconSize = AppSizes.iconLg,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.uiColors;
    final enabled = onPressed != null;

    final button = Opacity(
      opacity: enabled ? 1 : AppOpacity.disabled,
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadius.buttonAll,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.buttonAll,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, size: iconSize, color: colors.onSurface),
          ),
        ),
      ),
    );

    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}
