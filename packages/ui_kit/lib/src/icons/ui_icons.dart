import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../tokens/app_sizes.dart';

export 'package:lucide_icons_flutter/lucide_icons.dart' show LucideIcons;

/// Alias pratique : `UiIcons.home` == `LucideIcons.home`.
typedef UiIcons = LucideIcons;

/// Icône Lucide stylée selon les tailles du kit.
class UiIcon extends StatelessWidget {
  const UiIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  final IconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? AppSizes.iconLg,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}
