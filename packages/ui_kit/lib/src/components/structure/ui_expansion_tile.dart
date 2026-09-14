import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Expansion tile adaptatif.
class UiExpansionTile extends StatelessWidget {
  const UiExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.leading,
    this.initiallyExpanded = false,
  });

  final Widget title;
  final List<Widget> children;
  final Widget? subtitle;
  final Widget? leading;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return AdaptiveExpansionTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      initiallyExpanded: initiallyExpanded,
      children: children,
    );
  }
}
