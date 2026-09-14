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
    required this.primaryPressed,
    required this.primarySoft,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color divider;
  final Color disabled;
  final Color primaryPressed;
  final Color primarySoft;

  static const UiKitColors light = UiKitColors(
    success: AppColors.success,
    onSuccess: AppColors.onSuccess,
    warning: AppColors.warning,
    onWarning: AppColors.onWarning,
    info: AppColors.info,
    onInfo: AppColors.onInfo,
    divider: AppColors.dividerLight,
    disabled: AppColors.disabledLight,
    primaryPressed: AppColors.primaryPressed,
    primarySoft: AppColors.primarySoft,
  );

  static const UiKitColors dark = UiKitColors(
    success: AppColors.successDark,
    onSuccess: AppColors.onSuccessDark,
    warning: AppColors.warningDark,
    onWarning: AppColors.onWarningDark,
    info: AppColors.infoDark,
    onInfo: AppColors.onInfoDark,
    divider: AppColors.dividerDark,
    disabled: AppColors.disabledDark,
    primaryPressed: AppColors.primaryPressedDark,
    primarySoft: AppColors.primarySoftDark,
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
    Color? primaryPressed,
    Color? primarySoft,
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
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primarySoft: primarySoft ?? this.primarySoft,
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
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
    );
  }
}
