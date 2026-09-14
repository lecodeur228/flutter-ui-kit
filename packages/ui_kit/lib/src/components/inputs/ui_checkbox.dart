import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Checkbox adaptatif.
class UiCheckbox extends StatelessWidget {
  const UiCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.activeColor,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return AdaptiveCheckbox(
      value: value,
      onChanged: onChanged,
      tristate: tristate,
      activeColor: activeColor,
    );
  }
}
