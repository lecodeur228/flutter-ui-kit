import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

export 'package:adaptive_platform_ui/adaptive_platform_ui.dart' show BlurStyle;

/// Surface floue / liquid glass.
class UiBlurView extends StatelessWidget {
  const UiBlurView({
    super.key,
    required this.child,
    this.blurStyle = BlurStyle.systemUltraThinMaterial,
    this.borderRadius,
  });

  final Widget child;
  final BlurStyle blurStyle;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBlurView(
      blurStyle: blurStyle,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
