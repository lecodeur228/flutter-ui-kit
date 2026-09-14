import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/widgets.dart';

/// Destination de navigation bas de page (API ui_kit).
class UiNavDestination {
  const UiNavDestination({
    required this.label,
    required this.icon,
    this.iosSymbol,
    this.selectedIcon,
    this.badgeCount,
  });

  final String label;
  final IconData icon;
  final String? iosSymbol;
  final IconData? selectedIcon;
  final int? badgeCount;
}

/// Action dans l'app bar.
class UiAppBarAction {
  const UiAppBarAction({
    required this.onPressed,
    this.icon,
    this.iosSymbol,
    this.title,
  });

  final VoidCallback onPressed;
  final IconData? icon;
  final String? iosSymbol;
  final String? title;
}

/// Hauteur approximative de la tab bar native iOS 26 (hors home indicator).
const double kUiNativeTabBarHeight = 72;

/// Scaffold adaptatif avec toolbar / tab bar natives (liquid glass iOS 26+).
///
/// Sur iOS, le body est inset pour ne pas passer sous la toolbar overlay
/// ni sous la tab bar native. Sur Android, le [Scaffold] Material gère déjà
/// les insets AppBar / NavigationBar.
class UiScaffold extends StatelessWidget {
  const UiScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions = const [],
    this.leading,
    this.destinations = const [],
    this.selectedIndex = 0,
    this.onDestinationSelected,
    this.floatingActionButton,
    this.useNativeToolbar = true,
    this.useNativeBottomBar = true,
    this.safeTop = true,
    this.safeBottom = true,
  });

  final Widget body;
  final String? title;
  final List<UiAppBarAction> actions;
  final Widget? leading;
  final List<UiNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final Widget? floatingActionButton;
  final bool useNativeToolbar;
  final bool useNativeBottomBar;
  final bool safeTop;
  final bool safeBottom;

  bool get _hasAppBar =>
      title != null || actions.isNotEmpty || leading != null;

  bool get _hasBottomNav => destinations.isNotEmpty;

  Widget _insetBody(BuildContext context) {
    // Android Material Scaffold déjà inset — ne pas doubler.
    if (!PlatformInfo.isIOS) return body;

    // Liquid glass iOS 26 : le contenu doit passer SOUS la toolbar native
    // pour que le flou soit visible. Sinon la barre paraît opaque.
    final underNativeToolbar =
        useNativeToolbar && PlatformInfo.isIOS26OrHigher() && _hasAppBar;
    final applyTopSafe = safeTop && !underNativeToolbar;

    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return SafeArea(
      top: applyTopSafe,
      bottom: safeBottom && !_hasBottomNav,
      left: true,
      right: true,
      child: _hasBottomNav && safeBottom
          ? Padding(
              padding: EdgeInsets.only(
                bottom: kUiNativeTabBarHeight + bottomInset,
              ),
              child: body,
            )
          : body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: !_hasAppBar
          ? null
          : AdaptiveAppBar(
              title: title,
              leading: leading,
              useNativeToolbar: useNativeToolbar,
              actions: actions
                  .map(
                    (a) => AdaptiveAppBarAction(
                      onPressed: a.onPressed,
                      icon: a.icon,
                      iosSymbol: a.iosSymbol,
                      title: a.title,
                    ),
                  )
                  .toList(),
            ),
      bottomNavigationBar: !_hasBottomNav
          ? null
          : AdaptiveBottomNavigationBar(
              useNativeBottomBar: useNativeBottomBar,
              selectedIndex: selectedIndex,
              onTap: onDestinationSelected,
              items: destinations
                  .map(
                    (d) => AdaptiveNavigationDestination(
                      icon: d.iosSymbol ?? d.icon,
                      selectedIcon: d.selectedIcon,
                      label: d.label,
                      badgeCount: d.badgeCount,
                    ),
                  )
                  .toList(),
            ),
      floatingActionButton: floatingActionButton,
      enableBlur: true,
      enableToolbarGradient: true,
      body: _insetBody(context),
    );
  }
}
