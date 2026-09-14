import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

export 'package:adaptive_platform_ui/adaptive_platform_ui.dart'
    show AdaptiveSnackBarType;

/// Snackbar / banner adaptatif.
abstract final class UiSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    AdaptiveSnackBarType type = AdaptiveSnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? action,
    VoidCallback? onActionPressed,
  }) {
    AdaptiveSnackBar.show(
      context,
      message: message,
      type: type,
      duration: duration,
      action: action,
      onActionPressed: onActionPressed,
    );
  }
}
