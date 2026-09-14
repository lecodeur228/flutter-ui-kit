import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Slider adaptatif.
class UiSlider extends StatelessWidget {
  const UiSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.activeColor,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return AdaptiveSlider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      activeColor: activeColor,
    );
  }
}
