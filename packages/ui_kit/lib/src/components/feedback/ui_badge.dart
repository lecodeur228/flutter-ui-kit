import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_context.dart';

enum UiBadgeTone { neutral, primary, success, warning, error, info }

/// Pastille / badge du design system.
class UiBadge extends StatelessWidget {
  const UiBadge({
    super.key,
    required this.label,
    this.tone = UiBadgeTone.neutral,
  });

  final String label;
  final UiBadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.uiColors;
    final kit = context.uiKit;

    final (Color bg, Color fg) = switch (tone) {
      UiBadgeTone.neutral => (colors.surfaceContainerHighest, colors.onSurface),
      UiBadgeTone.primary => (colors.primaryContainer, colors.primary),
      UiBadgeTone.success => (kit.success.withValues(alpha: 0.15), kit.success),
      UiBadgeTone.warning => (kit.warning.withValues(alpha: 0.18), kit.warning),
      UiBadgeTone.error => (colors.error.withValues(alpha: 0.12), colors.error),
      UiBadgeTone.info => (kit.info.withValues(alpha: 0.15), kit.info),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.chipAll,
      ),
      child: Text(
        label,
        style: context.uiText.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
