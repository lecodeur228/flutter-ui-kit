import 'package:flutter/widgets.dart';

typedef ShowcaseBuilder = Widget Function(BuildContext context);

class ShowcaseItem {
  const ShowcaseItem({
    required this.title,
    required this.builder,
    this.fullPage = false,
  });

  final String title;
  final ShowcaseBuilder builder;

  /// Si true, le builder fournit déjà son [UiScaffold] (pas de page détail).
  final bool fullPage;
}

class ShowcaseSection {
  const ShowcaseSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<ShowcaseItem> items;
}
