import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';

/// Card adaptative (iOS / Material).
class UiCard extends StatelessWidget {
  const UiCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.card),
    this.onTap,
    this.elevation = 0,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final int elevation;

  @override
  Widget build(BuildContext context) {
    final card = AdaptiveCard(
      elevation: elevation.toDouble(),
      borderRadius: AppRadius.cardAll,
      padding: padding,
      child: child,
    );

    if (onTap == null) return card;

    return GestureDetector(
      onTap: onTap,
      child: card,
    );
  }
}
