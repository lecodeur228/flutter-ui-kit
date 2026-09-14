import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../tokens/app_colors.dart';
import 'ui_kit_theme.dart';

/// Application adaptive : Material (Android) / Cupertino + liquid glass (iOS).
class UiApp extends StatelessWidget {
  const UiApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.supportedLocales = const [
      Locale('fr'),
      Locale('en'),
    ],
    this.localizationsDelegates,
    this.debugShowCheckedModeBanner = false,
  });

  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeMode themeMode;
  final Locale? locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final bool debugShowCheckedModeBanner;

  static const List<LocalizationsDelegate<dynamic>> _defaultDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static CupertinoThemeData cupertinoTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      barBackgroundColor:
          isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      textTheme: CupertinoTextThemeData(
        primaryColor: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: (context, child) {
        final brightness = _resolveBrightness(context);
        final materialTheme =
            brightness == Brightness.dark ? UiKitTheme.dark : UiKitTheme.light;
        Widget wrapped = Theme(
          data: materialTheme,
          child: Material(
            type: MaterialType.transparency,
            child: child ?? const SizedBox.shrink(),
          ),
        );
        if (builder != null) {
          wrapped = builder!(context, wrapped);
        }
        return wrapped;
      },
      title: title,
      onGenerateTitle: onGenerateTitle,
      themeMode: themeMode,
      materialLightTheme: UiKitTheme.light,
      materialDarkTheme: UiKitTheme.dark,
      cupertinoLightTheme: cupertinoTheme(Brightness.light),
      cupertinoDarkTheme: cupertinoTheme(Brightness.dark),
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates ?? _defaultDelegates,
      material: (context, _) => MaterialAppData(
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      ),
      cupertino: (context, _) => CupertinoAppData(
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      ),
    );
  }

  Brightness _resolveBrightness(BuildContext context) {
    return switch (themeMode) {
      ThemeMode.dark => Brightness.dark,
      ThemeMode.light => Brightness.light,
      ThemeMode.system => MediaQuery.platformBrightnessOf(context),
    };
  }
}
