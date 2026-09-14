import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Section de formulaire groupée (style iOS Settings / Card Android).
class UiFormSection extends StatelessWidget {
  const UiFormSection({
    super.key,
    required this.children,
    this.header,
    this.footer,
    this.insetGrouped = true,
  });

  final List<Widget> children;
  final Widget? header;
  final Widget? footer;
  final bool insetGrouped;

  @override
  Widget build(BuildContext context) {
    if (insetGrouped) {
      return AdaptiveFormSection.insetGrouped(
        header: header,
        footer: footer,
        children: children,
      );
    }
    return AdaptiveFormSection(
      header: header,
      footer: footer,
      children: children,
    );
  }
}
