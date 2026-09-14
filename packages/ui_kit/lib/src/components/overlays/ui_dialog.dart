import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

export 'package:adaptive_platform_ui/adaptive_platform_ui.dart'
    show AlertAction, AlertActionStyle;

/// Dialogue adaptatif (UIAlertController liquid glass iOS 26+ / Material).
abstract final class UiDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    String? message,
    required List<AlertAction> actions,
    String? iosSymbol,
    IconData? icon,
  }) {
    return AdaptiveAlertDialog.show(
      context: context,
      title: title,
      message: message,
      actions: actions,
      icon: iosSymbol ?? icon,
    );
  }
}
