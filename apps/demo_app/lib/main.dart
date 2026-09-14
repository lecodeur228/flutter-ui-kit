import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import 'showcase/showcase_page.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ui_kit demo',
      debugShowCheckedModeBanner: false,
      theme: UiKitTheme.light,
      darkTheme: UiKitTheme.dark,
      themeMode: _mode,
      home: ShowcasePage(
        isDark: _mode == ThemeMode.dark,
        onToggleTheme: () {
          setState(() {
            _mode =
                _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          });
        },
      ),
    );
  }
}
