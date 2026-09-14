import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import 'component_detail_page.dart';
import 'component_previews.dart';
import 'showcase_item.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String _query = '';

  List<ShowcaseSection> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return kShowcaseCatalog;

    return kShowcaseCatalog
        .map((section) {
          final items = section.items
              .where((item) => item.title.toLowerCase().contains(q))
              .toList();
          return ShowcaseSection(title: section.title, items: items);
        })
        .where((section) => section.items.isNotEmpty)
        .toList();
  }

  void _open(ShowcaseItem item) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ComponentDetailPage(
          title: item.title,
          child: item.builder(context),
        ),
      ),
    );
  }

  void _cycleTheme() {
    final next = switch (widget.themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    widget.onThemeModeChanged(next);
  }

  IconData get _themeIcon => switch (widget.themeMode) {
        ThemeMode.dark => LucideIcons.moon,
        ThemeMode.light => LucideIcons.sun,
        ThemeMode.system => LucideIcons.sunMoon,
      };

  @override
  Widget build(BuildContext context) {
    final sections = _filtered;

    return UiScaffold(
      title: 'ui_kit',
      useNativeToolbar: true,
      actions: [
        UiAppBarAction(
          onPressed: _cycleTheme,
          icon: _themeIcon,
          iosSymbol: 'circle.lefthalf.filled',
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.sm,
          AppSpacing.page,
          AppSpacing.xxl,
        ),
        children: [
          UiTextField(
            hint: 'Search components',
            prefixIcon: LucideIcons.search,
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (sections.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.xxl),
              child: Center(
                child: UiText(
                  'Aucun composant',
                  style: UiTextStyle.bodyMedium,
                ),
              ),
            )
          else
            for (final section in sections)
              _CatalogSection(section: section, onTap: _open),
        ],
      ),
    );
  }
}

class _CatalogSection extends StatelessWidget {
  const _CatalogSection({
    required this.section,
    required this.onTap,
  });

  final ShowcaseSection section;
  final ValueChanged<ShowcaseItem> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.xs,
              bottom: AppSpacing.sm,
            ),
            child: Text(
              section.title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: AppRadius.cardAll,
            ),
            child: Column(
              children: [
                for (var i = 0; i < section.items.length; i++) ...[
                  if (i > 0)
                    Divider(
                      height: 1,
                      indent: AppSpacing.lg,
                      color: colors.outlineVariant,
                    ),
                  _CatalogTile(
                    title: section.items[i].title,
                    onTap: () => onTap(section.items[i]),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogTile extends StatelessWidget {
  const _CatalogTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.cardAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Row(
          children: [
            Expanded(
              child: UiText(title, style: UiTextStyle.bodyLarge),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
