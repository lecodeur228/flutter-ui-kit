import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Page de détail unique : même coquille, contenu injecté.
class ComponentDetailPage extends StatelessWidget {
  const ComponentDetailPage({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final topPad = PlatformInfo.isIOS26OrHigher()
        ? MediaQuery.paddingOf(context).top + 52
        : AppSpacing.sm;

    return UiScaffold(
      title: title,
      useNativeToolbar: true,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.page,
          topPad,
          AppSpacing.page,
          AppSpacing.xxl,
        ),
        children: [child],
      ),
    );
  }
}
