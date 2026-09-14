import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

/// Time picker adaptatif.
abstract final class UiTimePicker {
  static Future<TimeOfDay?> show({
    required BuildContext context,
    TimeOfDay? initialTime,
    bool use24HourFormat = true,
  }) {
    return AdaptiveTimePicker.show(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      use24HourFormat: use24HourFormat,
    );
  }
}
