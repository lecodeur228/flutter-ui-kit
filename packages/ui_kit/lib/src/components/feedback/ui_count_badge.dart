import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Badge compteur (notifications) — distinct de [UiBadge] (chip label).
class UiCountBadge extends StatelessWidget {
  const UiCountBadge({
    super.key,
    required this.child,
    this.count,
    this.label,
    this.showZero = false,
  });

  final Widget child;
  final int? count;
  final String? label;
  final bool showZero;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBadge(
      count: count,
      label: label,
      showZero: showZero,
      child: child,
    );
  }
}
