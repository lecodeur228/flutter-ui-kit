import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

/// FAB Journey — couleur primary du thème.
class UiFloatingActionButton extends StatelessWidget {
  const UiFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.mini = false,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool mini;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AdaptiveFloatingActionButton(
      onPressed: onPressed,
      mini: mini,
      tooltip: tooltip,
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      child: child,
    );
  }
}
