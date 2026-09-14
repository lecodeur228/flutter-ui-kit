import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Tabs + contenu swipeable adaptatif.
class UiTabView extends StatelessWidget {
  const UiTabView({
    super.key,
    required this.tabs,
    required this.children,
    this.onTabChanged,
  });

  final List<String> tabs;
  final List<Widget> children;
  final ValueChanged<int>? onTabChanged;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTabBarView(
      tabs: tabs,
      onTabChanged: onTabChanged,
      children: children,
    );
  }
}
