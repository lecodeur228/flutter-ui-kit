import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Tooltip adaptatif.
class UiTooltip extends StatelessWidget {
  const UiTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTooltip(
      message: message,
      child: child,
    );
  }
}
