import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_colors.dart';

/// Checkbox Journey — carré arrondi, couleur primary.
class UiCheckbox extends StatelessWidget {
  const UiCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.label,
    this.enabled = true,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final String? label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final kit = Theme.of(context).extension<UiKitColors>();
    final muted = kit?.disabled ?? scheme.onSurfaceVariant;

    final checkbox = Checkbox(
      value: value,
      tristate: tristate,
      onChanged: enabled ? onChanged : null,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.xsAll),
      side: BorderSide(
        color: enabled ? scheme.outline : scheme.outlineVariant,
        width: 1.5,
      ),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return scheme.surfaceContainerHighest;
        }
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: scheme.onPrimary,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );

    if (label == null) return checkbox;

    return InkWell(
      onTap: !enabled || onChanged == null
          ? null
          : () {
              if (tristate) {
                final next = switch (value) {
                  false => true,
                  true => null,
                  null => false,
                };
                onChanged!(next);
              } else {
                onChanged!(!(value ?? false));
              }
            },
      borderRadius: AppRadius.smAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkbox,
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
