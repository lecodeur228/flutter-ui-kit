import 'package:flutter/material.dart';

import 'ui_kit_colors.dart';

/// Accès rapide aux extensions du kit depuis un [BuildContext].
extension UiKitContext on BuildContext {
  ThemeData get uiTheme => Theme.of(this);

  ColorScheme get uiColors => Theme.of(this).colorScheme;

  TextTheme get uiText => Theme.of(this).textTheme;

  UiKitColors get uiKit => Theme.of(this).extension<UiKitColors>()!;
}
