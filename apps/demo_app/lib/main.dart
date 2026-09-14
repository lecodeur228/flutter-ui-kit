import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import 'showcase/catalog_page.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return UiApp(
      title: 'ui_kit demo',
      themeMode: _mode,
      home: CatalogPage(
        themeMode: _mode,
        onThemeModeChanged: (mode) => setState(() => _mode = mode),
      ),
    );
  }
}
