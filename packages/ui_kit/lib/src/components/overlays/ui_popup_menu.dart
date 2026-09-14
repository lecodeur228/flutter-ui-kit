import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

export 'package:adaptive_platform_ui/adaptive_platform_ui.dart'
    show
        AdaptivePopupMenuItem,
        AdaptivePopupMenuDivider,
        AdaptivePopupMenuEntry,
        PopupButtonStyle;

/// Popup menu adaptatif.
abstract final class UiPopupMenu {
  static Widget text<T>({
    Key? key,
    required String label,
    required List<AdaptivePopupMenuEntry> items,
    required void Function(int index, AdaptivePopupMenuItem<T> entry)
        onSelected,
    PopupButtonStyle buttonStyle = PopupButtonStyle.plain,
  }) {
    return AdaptivePopupMenuButton.text<T>(
      key: key,
      label: label,
      items: items,
      onSelected: onSelected,
      buttonStyle: buttonStyle,
    );
  }

  static Widget icon<T>({
    Key? key,
    required String iosSymbol,
    required List<AdaptivePopupMenuEntry> items,
    required void Function(int index, AdaptivePopupMenuItem<T> entry)
        onSelected,
    PopupButtonStyle buttonStyle = PopupButtonStyle.glass,
  }) {
    return AdaptivePopupMenuButton.icon<T>(
      key: key,
      icon: iosSymbol,
      items: items,
      onSelected: onSelected,
      buttonStyle: buttonStyle,
    );
  }
}
