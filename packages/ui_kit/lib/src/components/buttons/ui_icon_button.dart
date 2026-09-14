import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../tokens/app_sizes.dart';

/// Bouton icône adaptatif.
class UiIconButton extends StatelessWidget {
  const UiIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size = AppSizes.buttonMd,
    this.iconSize = AppSizes.iconLg,
    this.iosSymbol,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final double iconSize;
  final String? iosSymbol;

  @override
  Widget build(BuildContext context) {
    final button = iosSymbol != null
        ? AdaptiveButton.sfSymbol(
            onPressed: onPressed,
            enabled: onPressed != null,
            sfSymbol: SFSymbol(iosSymbol!, size: iconSize),
            style: AdaptiveButtonStyle.plain,
            size: AdaptiveButtonSize.medium,
            minSize: Size(size, size),
          )
        : AdaptiveButton.icon(
            onPressed: onPressed,
            enabled: onPressed != null,
            icon: icon,
            style: AdaptiveButtonStyle.plain,
            size: AdaptiveButtonSize.medium,
            minSize: Size(size, size),
          );

    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}
