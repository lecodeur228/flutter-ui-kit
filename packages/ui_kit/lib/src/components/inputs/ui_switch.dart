import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Switch adaptatif (UISwitch natif iOS 26+ / Cupertino / Material).
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
    return AdaptiveSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}
