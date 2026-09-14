import 'package:flutter/material.dart';

/// Switch Journey — activeColor = primary du thème.
class UiSwitch extends StatelessWidget {
  const UiSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = activeColor ?? scheme.primary;

    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeThumbColor: scheme.onPrimary,
      activeTrackColor: active,
      inactiveThumbColor: scheme.surface,
      inactiveTrackColor: scheme.outlineVariant,
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.transparent;
        return scheme.outline;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
