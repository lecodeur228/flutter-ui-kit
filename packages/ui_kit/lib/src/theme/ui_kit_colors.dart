import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

/// Couleurs sémantiques exposées via [ThemeExtension].
@immutable
class UiKitColors extends ThemeExtension<UiKitColors> {
  const UiKitColors({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.divider,
    required this.disabled,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color divider;
  final Color disabled;

  static const UiKitColors light = UiKitColors(
    success: AppColors.success,
    onSuccess: AppColors.onSuccess,
    warning: AppColors.warning,
    onWarning: AppColors.onWarning,
    info: AppColors.info,
    onInfo: AppColors.onInfo,
    divider: AppColors.dividerLight,
    disabled: AppColors.disabledLight,
  );

  static const UiKitColors dark = UiKitColors(
    success: AppColors.success,
    onSuccess: AppColors.onSuccess,
    warning: AppColors.warning,
    onWarning: AppColors.onWarning,
    info: AppColors.info,
    onInfo: AppColors.onInfo,
    divider: AppColors.dividerDark,
    disabled: AppColors.disabledDark,
  );

  @override
  UiKitColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? divider,
    Color? disabled,
  }) {
    return UiKitColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      divider: divider ?? this.divider,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  UiKitColors lerp(ThemeExtension<UiKitColors>? other, double t) {
    if (other is! UiKitColors) return this;
    return UiKitColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}
