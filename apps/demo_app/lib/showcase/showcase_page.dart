import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ui_kit'),
        actions: [
          UiIconButton(
            icon: isDark ? Icons.light_mode : Icons.dark_mode,
            tooltip: 'Basculer le thème',
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.page),
        children: const [
          _SectionTitle('Couleurs'),
          _ColorsSection(),
          UiDivider(),
          _SectionTitle('Espacements'),
          _SpacingSection(),
          UiDivider(),
          _SectionTitle('Radius'),
          _RadiusSection(),
          UiDivider(),
          _SectionTitle('Boutons'),
          _ButtonsSection(),
          UiDivider(),
          _SectionTitle('Inputs'),
          _InputsSection(),
          UiDivider(),
          _SectionTitle('Card & Badge'),
          _CardBadgeSection(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: UiText(label, style: UiTextStyle.titleLarge),
    );
  }
}

class _ColorsSection extends StatelessWidget {
  const _ColorsSection();

  @override
  Widget build(BuildContext context) {
    final c = context.uiColors;
    final kit = context.uiKit;

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _Swatch('primary', c.primary),
        _Swatch('secondary', c.secondary),
        _Swatch('surface', c.surface),
        _Swatch('error', c.error),
        _Swatch('success', kit.success),
        _Swatch('warning', kit.warning),
        _Swatch('info', kit.info),
        _Swatch('outline', c.outline),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppRadius.cardAll,
            border: Border.all(color: context.uiColors.outlineVariant),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        UiText(label, style: UiTextStyle.labelSmall),
      ],
    );
  }
}

class _SpacingSection extends StatelessWidget {
  const _SpacingSection();

  @override
  Widget build(BuildContext context) {
    const scales = <(String, double)>[
      ('xs', AppSpacing.xs),
      ('sm', AppSpacing.sm),
      ('md', AppSpacing.md),
      ('lg', AppSpacing.lg),
      ('xl', AppSpacing.xl),
      ('xxl', AppSpacing.xxl),
    ];

    return Column(
      children: [
        for (final (name, value) in scales)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                  child: UiText(name, style: UiTextStyle.labelMedium),
                ),
                Expanded(
                  child: Container(
                    height: 12,
                    width: value * 4,
                    color: context.uiColors.primary.withValues(alpha: 0.35),
                  ),
                ),
                UiText('${value.toInt()}', style: UiTextStyle.bodySmall),
              ],
            ),
          ),
      ],
    );
  }
}

class _RadiusSection extends StatelessWidget {
  const _RadiusSection();

  @override
  Widget build(BuildContext context) {
    const items = <(String, double)>[
      ('sm', AppRadius.sm),
      ('md', AppRadius.md),
      ('lg', AppRadius.lg),
      ('full', AppRadius.full),
    ];

    return Wrap(
      spacing: AppSpacing.md,
      children: [
        for (final (name, radius) in items)
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.uiColors.primaryContainer,
              borderRadius: BorderRadius.circular(radius > 100 ? 32 : radius),
            ),
            child: UiText(name, style: UiTextStyle.labelSmall),
          ),
      ],
    );
  }
}

class _ButtonsSection extends StatelessWidget {
  const _ButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        UiButton(label: 'Primary', onPressed: () {}),
        UiButton(
          label: 'Secondary',
          variant: UiButtonVariant.secondary,
          onPressed: () {},
        ),
        UiButton(
          label: 'Outline',
          variant: UiButtonVariant.outline,
          onPressed: () {},
        ),
        UiButton(
          label: 'Ghost',
          variant: UiButtonVariant.ghost,
          onPressed: () {},
        ),
        UiButton(
          label: 'Destructive',
          variant: UiButtonVariant.destructive,
          onPressed: () {},
        ),
        const UiButton(label: 'Loading', isLoading: true, onPressed: null),
        UiButton(
          label: 'Small',
          size: UiButtonSize.sm,
          icon: Icons.add,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _InputsSection extends StatelessWidget {
  const _InputsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UiTextField(
          label: 'Email',
          hint: 'vous@exemple.com',
          prefixIcon: Icons.mail_outline,
        ),
        SizedBox(height: AppSpacing.md),
        UiTextField(
          label: 'Mot de passe',
          hint: '••••••••',
          obscureText: true,
          prefixIcon: Icons.lock_outline,
          errorText: 'Minimum 8 caractères',
        ),
      ],
    );
  }
}

class _CardBadgeSection extends StatelessWidget {
  const _CardBadgeSection();

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: UiText('Carte produit', style: UiTextStyle.titleMedium),
              ),
              const UiBadge(label: 'Nouveau', tone: UiBadgeTone.primary),
              const SizedBox(width: AppSpacing.xs),
              const UiBadge(label: 'OK', tone: UiBadgeTone.success),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          UiText(
            'Contenu aligné sur AppSpacing.card et AppRadius.card.',
            style: UiTextStyle.bodyMedium,
            color: context.uiColors.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.lg),
          UiButton(
            label: 'Action',
            expanded: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
