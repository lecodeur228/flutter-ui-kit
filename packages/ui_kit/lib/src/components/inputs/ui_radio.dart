import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_colors.dart';

/// Groupe de radios Journey — enveloppe [RadioGroup].
class UiRadioGroup<T> extends StatelessWidget {
  const UiRadioGroup({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.child,
  });

  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: child,
    );
  }
}

/// Radio Journey — primary, label optionnel.
///
/// À placer sous un [UiRadioGroup] (ou [RadioGroup]) du même type `T`.
class UiRadio<T> extends StatelessWidget {
  const UiRadio({
    super.key,
    required this.value,
    this.label,
    this.enabled = true,
  });

  final T value;
  final String? label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final kit = Theme.of(context).extension<UiKitColors>();
    final muted = kit?.disabled ?? scheme.onSurfaceVariant;

    final radio = Radio<T>(
      value: value,
      enabled: enabled,
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return muted;
        if (states.contains(WidgetState.selected)) return scheme.primary;
        return scheme.outline;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );

    if (label == null) return radio;

    return InkWell(
      onTap: !enabled
          ? null
          : () => RadioGroup.maybeOf<T>(context)?.onChanged(value),
      borderRadius: AppRadius.smAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radio,
            const SizedBox(width: AppSpacing.xs),
            Flexible(
              child: Text(
                label!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: enabled ? scheme.onSurface : muted,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
