import 'package:flutter/widgets.dart';

typedef ShowcaseBuilder = Widget Function(BuildContext context);

class ShowcaseItem {
  const ShowcaseItem({
    required this.title,
    required this.builder,
  });

  final String title;
  final ShowcaseBuilder builder;
}

class ShowcaseSection {
  const ShowcaseSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<ShowcaseItem> items;
}
