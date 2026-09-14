import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import '../../theme/ui_kit_context.dart';

/// Séparateur horizontal du design system.
class UiDivider extends StatelessWidget {
  const UiDivider({
    super.key,
    this.indent = 0,
    this.endIndent = 0,
    this.spacing = AppSpacing.md,
  });

  final double indent;
  final double endIndent;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing / 2),
      child: Divider(
        color: context.uiKit.divider,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}
