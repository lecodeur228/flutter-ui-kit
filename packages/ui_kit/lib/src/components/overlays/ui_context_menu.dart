import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Action de menu contextuel.
typedef UiContextMenuAction = AdaptiveContextMenuAction;

/// Menu contextuel adaptatif (long press).
class UiContextMenu extends StatelessWidget {
  const UiContextMenu({
    super.key,
    required this.child,
    required this.actions,
  });

  final Widget child;
  final List<UiContextMenuAction> actions;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContextMenu(
      actions: actions,
      child: child,
    );
  }
}
