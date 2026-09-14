import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Segmented control adaptatif (liquid glass iOS 26+).
class UiSegmentedControl extends StatelessWidget {
  const UiSegmentedControl({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.enabled = true,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AdaptiveSegmentedControl(
      labels: labels,
      selectedIndex: selectedIndex,
      onValueChanged: onChanged,
      enabled: enabled,
    );
  }
}
