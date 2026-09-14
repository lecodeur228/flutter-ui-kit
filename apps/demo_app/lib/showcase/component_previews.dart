import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

import 'showcase_item.dart';

final List<ShowcaseSection> kShowcaseCatalog = [
  ShowcaseSection(
    title: 'Foundations',
    items: [
      ShowcaseItem(title: 'Colors', builder: (_) => const ColorsPreview()),
      ShowcaseItem(title: 'Spacing', builder: (_) => const SpacingPreview()),
      ShowcaseItem(title: 'Radius', builder: (_) => const RadiusPreview()),
      ShowcaseItem(title: 'Sizes', builder: (_) => const SizesPreview()),
      ShowcaseItem(
        title: 'Typography',
        builder: (_) => const TypographyPreview(),
      ),
      ShowcaseItem(
        title: 'Elevation',
        builder: (_) => const ElevationPreview(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Adaptive Controls',
    items: [
      ShowcaseItem(title: 'Button', builder: (_) => const ButtonPreview()),
      ShowcaseItem(
        title: 'Icon Button',
        builder: (_) => const IconButtonPreview(),
      ),
      ShowcaseItem(
        title: 'Floating Action Button',
        builder: (_) => const FabPreview(),
      ),
      ShowcaseItem(title: 'Switch', builder: (_) => const SwitchPreview()),
      ShowcaseItem(title: 'Checkbox', builder: (_) => const CheckboxPreview()),
      ShowcaseItem(title: 'Radio', builder: (_) => const RadioPreview()),
      ShowcaseItem(title: 'Slider', builder: (_) => const SliderPreview()),
      ShowcaseItem(
        title: 'Segmented',
        builder: (_) => const SegmentedPreview(),
      ),
      ShowcaseItem(
        title: 'Text Field',
        builder: (_) => const TextFieldPreview(),
      ),
      ShowcaseItem(
        title: 'Text Form Field',
        builder: (_) => const TextFormFieldPreview(),
      ),
      ShowcaseItem(
        title: 'Phone Field',
        builder: (_) => const PhoneFieldPreview(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Icons',
    items: [
      ShowcaseItem(title: 'Lucide Icons', builder: (_) => const IconsPreview()),
    ],
  ),
  ShowcaseSection(
    title: 'Structure',
    items: [
      ShowcaseItem(
        title: 'Scaffold / Bottom Nav',
        builder: (_) => const ScaffoldNavPreview(),
      ),
      ShowcaseItem(title: 'Tab View', builder: (_) => const TabViewPreview()),
      ShowcaseItem(
        title: 'Form Section',
        builder: (_) => const FormSectionPreview(),
      ),
      ShowcaseItem(
        title: 'Expansion Tile',
        builder: (_) => const ExpansionTilePreview(),
      ),
      ShowcaseItem(title: 'List Tile', builder: (_) => const ListTilePreview()),
      ShowcaseItem(title: 'Divider', builder: (_) => const DividerPreview()),
    ],
  ),
  ShowcaseSection(
    title: 'Feedback & Overlays',
    items: [
      ShowcaseItem(title: 'Dialog', builder: (_) => const DialogPreview()),
      ShowcaseItem(title: 'SnackBar', builder: (_) => const SnackBarPreview()),
      ShowcaseItem(
        title: 'Date Picker',
        builder: (_) => const DatePickerPreview(),
      ),
      ShowcaseItem(
        title: 'Time Picker',
        builder: (_) => const TimePickerPreview(),
      ),
      ShowcaseItem(
        title: 'Context Menu',
        builder: (_) => const ContextMenuPreview(),
      ),
      ShowcaseItem(
        title: 'Popup Menu',
        builder: (_) => const PopupMenuPreview(),
      ),
      ShowcaseItem(title: 'Tooltip', builder: (_) => const TooltipPreview()),
      ShowcaseItem(title: 'Badge', builder: (_) => const BadgePreview()),
      ShowcaseItem(
        title: 'Count Badge',
        builder: (_) => const CountBadgePreview(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Content',
    items: [
      ShowcaseItem(title: 'Card', builder: (_) => const CardPreview()),
      ShowcaseItem(title: 'Blur View', builder: (_) => const BlurViewPreview()),
      ShowcaseItem(title: 'Text', builder: (_) => const TextPreview()),
    ],
  ),
];

class ColorsPreview extends StatelessWidget {
  const ColorsPreview({super.key});

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

class SpacingPreview extends StatelessWidget {
  const SpacingPreview({super.key});

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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 12,
                      width: value * 4,
                      color: context.uiColors.primary.withValues(alpha: 0.35),
                    ),
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

class RadiusPreview extends StatelessWidget {
  const RadiusPreview({super.key});

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

class SizesPreview extends StatelessWidget {
  const SizesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = <(String, double)>[
      ('buttonSm', AppSizes.buttonSm),
      ('buttonMd', AppSizes.buttonMd),
      ('buttonLg', AppSizes.buttonLg),
      ('input', AppSizes.input),
      ('iconMd', AppSizes.iconMd),
      ('iconLg', AppSizes.iconLg),
      ('avatarMd', AppSizes.avatarMd),
    ];

    return Column(
      children: [
        for (final (name, value) in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              children: [
                Expanded(child: UiText(name, style: UiTextStyle.bodyMedium)),
                UiText('${value.toInt()}', style: UiTextStyle.labelMedium),
              ],
            ),
          ),
      ],
    );
  }
}

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiText('Display Small', style: UiTextStyle.displaySmall),
        SizedBox(height: AppSpacing.sm),
        UiText('Headline Small', style: UiTextStyle.headlineSmall),
        SizedBox(height: AppSpacing.sm),
        UiText('Title Large', style: UiTextStyle.titleLarge),
        SizedBox(height: AppSpacing.sm),
        UiText(
          'Body Large — texte de paragraphe.',
          style: UiTextStyle.bodyLarge,
        ),
        SizedBox(height: AppSpacing.sm),
        UiText('Label Large', style: UiTextStyle.labelLarge),
      ],
    );
  }
}

class ElevationPreview extends StatelessWidget {
  const ElevationPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.lg,
      children: [
        for (var level = 0; level <= 4; level++)
          Container(
            width: 88,
            height: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.uiColors.surface,
              borderRadius: AppRadius.cardAll,
              boxShadow: AppElevation.of(level),
            ),
            child: UiText('L$level', style: UiTextStyle.labelMedium),
          ),
      ],
    );
  }
}

class ButtonPreview extends StatelessWidget {
  const ButtonPreview({super.key});

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
        const UiButton(label: 'Loading', isLoading: true),
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

class IconButtonPreview extends StatelessWidget {
  const IconButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UiIconButton(icon: Icons.favorite_border, onPressed: () {}),
        UiIconButton(icon: Icons.share_outlined, onPressed: () {}),
        UiIconButton(
          icon: Icons.more_horiz,
          iosSymbol: 'ellipsis.circle',
          onPressed: () {},
        ),
        const UiIconButton(icon: Icons.delete_outline),
      ],
    );
  }
}

class SwitchPreview extends StatefulWidget {
  const SwitchPreview({super.key});

  @override
  State<SwitchPreview> createState() => _SwitchPreviewState();
}

class _SwitchPreviewState extends State<SwitchPreview> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: UiText('Notifications', style: UiTextStyle.bodyLarge)),
        UiSwitch(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
        ),
      ],
    );
  }
}

class CheckboxPreview extends StatefulWidget {
  const CheckboxPreview({super.key});

  @override
  State<CheckboxPreview> createState() => _CheckboxPreviewState();
}

class _CheckboxPreviewState extends State<CheckboxPreview> {
  bool _a = true;
  bool _b = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            UiCheckbox(
              value: _a,
              onChanged: (v) => setState(() => _a = v ?? false),
            ),
            const SizedBox(width: AppSpacing.sm),
            const UiText('Accepter les conditions'),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            UiCheckbox(
              value: _b,
              onChanged: (v) => setState(() => _b = v ?? false),
            ),
            const SizedBox(width: AppSpacing.sm),
            const UiText('Recevoir la newsletter'),
          ],
        ),
      ],
    );
  }
}

enum _RadioOption { a, b, c }

class RadioPreview extends StatefulWidget {
  const RadioPreview({super.key});

  @override
  State<RadioPreview> createState() => _RadioPreviewState();
}

class _RadioPreviewState extends State<RadioPreview> {
  _RadioOption _selected = _RadioOption.a;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final option in _RadioOption.values)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              children: [
                UiRadio<_RadioOption>(
                  value: option,
                  groupValue: _selected,
                  onChanged: (v) => setState(() => _selected = v!),
                ),
                const SizedBox(width: AppSpacing.sm),
                UiText('Option ${option.name.toUpperCase()}'),
              ],
            ),
          ),
      ],
    );
  }
}

class SliderPreview extends StatefulWidget {
  const SliderPreview({super.key});

  @override
  State<SliderPreview> createState() => _SliderPreviewState();
}

class _SliderPreviewState extends State<SliderPreview> {
  double _value = 0.4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiText('Valeur : ${(_value * 100).round()}%'),
        const SizedBox(height: AppSpacing.md),
        UiSlider(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
        ),
      ],
    );
  }
}

class SegmentedPreview extends StatefulWidget {
  const SegmentedPreview({super.key});

  @override
  State<SegmentedPreview> createState() => _SegmentedPreviewState();
}

class _SegmentedPreviewState extends State<SegmentedPreview> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return UiSegmentedControl(
      labels: const ['Jour', 'Semaine', 'Mois'],
      selectedIndex: _index,
      onChanged: (i) => setState(() => _index = i),
    );
  }
}

class TextFieldPreview extends StatelessWidget {
  const TextFieldPreview({super.key});

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

class ScaffoldNavPreview extends StatefulWidget {
  const ScaffoldNavPreview({super.key});

  @override
  State<ScaffoldNavPreview> createState() => _ScaffoldNavPreviewState();
}

class _ScaffoldNavPreviewState extends State<ScaffoldNavPreview> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ClipRRect(
        borderRadius: AppRadius.cardAll,
        child: UiScaffold(
          title: 'Liquid Glass',
          useNativeToolbar: true,
          useNativeBottomBar: true,
          safeTop: false,
          safeBottom: false,
          destinations: const [
            UiNavDestination(
              label: 'Home',
              icon: Icons.home,
              iosSymbol: 'house.fill',
            ),
            UiNavDestination(
              label: 'Search',
              icon: Icons.search,
              iosSymbol: 'magnifyingglass',
            ),
            UiNavDestination(
              label: 'Profile',
              icon: Icons.person,
              iosSymbol: 'person.fill',
            ),
          ],
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: UiText(
                'Tab $_index — toolbar / tab bar natifs iOS 26+',
                style: UiTextStyle.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListTilePreview extends StatelessWidget {
  const ListTilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Profil'),
          subtitle: const Text('Informations du compte'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        UiListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          trailing: UiSwitch(value: true, onChanged: (_) {}),
        ),
      ],
    );
  }
}

class DividerPreview extends StatelessWidget {
  const DividerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiText('Au-dessus', style: UiTextStyle.bodyMedium),
        UiDivider(),
        UiText('En-dessous', style: UiTextStyle.bodyMedium),
      ],
    );
  }
}

class DialogPreview extends StatelessWidget {
  const DialogPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiButton(
      label: 'Ouvrir le dialogue',
      onPressed: () {
        UiDialog.show(
          context: context,
          title: 'Confirmer',
          message: 'Appliquer le style natif de la plateforme ?',
          iosSymbol: 'checkmark.circle.fill',
          icon: Icons.check_circle,
          actions: [
            AlertAction(
              title: 'Annuler',
              style: AlertActionStyle.cancel,
              onPressed: () {},
            ),
            AlertAction(
              title: 'Confirmer',
              style: AlertActionStyle.primary,
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}

class ContextMenuPreview extends StatelessWidget {
  const ContextMenuPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiContextMenu(
      actions: [
        UiContextMenuAction(
          title: 'Modifier',
          icon: Icons.edit,
          onPressed: () {},
        ),
        UiContextMenuAction(
          title: 'Partager',
          icon: Icons.share,
          onPressed: () {},
        ),
        UiContextMenuAction(
          title: 'Supprimer',
          icon: Icons.delete,
          isDestructive: true,
          onPressed: () {},
        ),
      ],
      child: UiCard(
        child: UiText(
          'Appui long ici',
          style: UiTextStyle.bodyLarge,
          color: context.uiColors.onSurface,
        ),
      ),
    );
  }
}

class PopupMenuPreview extends StatelessWidget {
  const PopupMenuPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiPopupMenu.text<String>(
      label: 'Options',
      items: [
        AdaptivePopupMenuItem(
          label: 'Modifier',
          value: 'edit',
          icon: Icons.edit,
        ),
        AdaptivePopupMenuItem(
          label: 'Supprimer',
          value: 'delete',
          icon: Icons.delete,
        ),
        const AdaptivePopupMenuDivider(),
        AdaptivePopupMenuItem(
          label: 'Partager',
          value: 'share',
          icon: Icons.share,
        ),
      ],
      onSelected: (index, item) {},
    );
  }
}

class BadgePreview extends StatelessWidget {
  const BadgePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        UiBadge(label: 'Neutral'),
        UiBadge(label: 'Primary', tone: UiBadgeTone.primary),
        UiBadge(label: 'Success', tone: UiBadgeTone.success),
        UiBadge(label: 'Warning', tone: UiBadgeTone.warning),
        UiBadge(label: 'Error', tone: UiBadgeTone.error),
        UiBadge(label: 'Info', tone: UiBadgeTone.info),
      ],
    );
  }
}

class CardPreview extends StatelessWidget {
  const CardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UiText('Carte produit', style: UiTextStyle.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          UiText(
            'Contenu aligné sur les tokens ui_kit.',
            style: UiTextStyle.bodyMedium,
            color: context.uiColors.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.lg),
          UiButton(label: 'Action', expanded: true, onPressed: () {}),
        ],
      ),
    );
  }
}

class TextPreview extends StatelessWidget {
  const TextPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiText('Titre', style: UiTextStyle.titleLarge),
        SizedBox(height: AppSpacing.sm),
        UiText(
          'Corps de texte utilisant UiText et les styles du kit.',
          style: UiTextStyle.bodyMedium,
        ),
      ],
    );
  }
}

class FabPreview extends StatelessWidget {
  const FabPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: UiFloatingActionButton(
        onPressed: () {},
        tooltip: 'Ajouter',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TextFormFieldPreview extends StatelessWidget {
  const TextFormFieldPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: UiTextFormField(
        label: 'Nom',
        hint: 'Votre nom',
        prefixIcon: Icons.person_outline,
        validator: (v) =>
            (v == null || v.isEmpty) ? 'Champ requis' : null,
      ),
    );
  }
}

class TabViewPreview extends StatelessWidget {
  const TabViewPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: UiTabView(
        tabs: const ['Un', 'Deux', 'Trois'],
        children: [
          for (final label in ['Un', 'Deux', 'Trois'])
            Center(child: UiText('Page $label', style: UiTextStyle.titleMedium)),
        ],
      ),
    );
  }
}

class FormSectionPreview extends StatelessWidget {
  const FormSectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiFormSection(
      header: const Text('Compte'),
      footer: const Text('Informations visibles sur ton profil.'),
      children: [
        UiListTile(
          title: const Text('Email'),
          subtitle: const Text('vous@exemple.com'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        UiListTile(
          title: const Text('Téléphone'),
          subtitle: const Text('+33 6 00 00 00 00'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ],
    );
  }
}

class ExpansionTilePreview extends StatelessWidget {
  const ExpansionTilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiExpansionTile(
      title: Text('Détails'),
      subtitle: Text('Appuyer pour développer'),
      children: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: UiText(
            'Contenu expansible adaptatif.',
            style: UiTextStyle.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class SnackBarPreview extends StatelessWidget {
  const SnackBarPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        UiButton(
          label: 'Info',
          onPressed: () => UiSnackBar.show(context, message: 'Message info'),
        ),
        UiButton(
          label: 'Success',
          variant: UiButtonVariant.secondary,
          onPressed: () => UiSnackBar.show(
            context,
            message: 'Enregistré',
            type: AdaptiveSnackBarType.success,
          ),
        ),
        UiButton(
          label: 'Error',
          variant: UiButtonVariant.destructive,
          onPressed: () => UiSnackBar.show(
            context,
            message: 'Une erreur est survenue',
            type: AdaptiveSnackBarType.error,
          ),
        ),
      ],
    );
  }
}

class DatePickerPreview extends StatelessWidget {
  const DatePickerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiButton(
      label: 'Choisir une date',
      onPressed: () async {
        final date = await UiDatePicker.show(context: context);
        if (date != null && context.mounted) {
          UiSnackBar.show(
            context,
            message: '${date.day}/${date.month}/${date.year}',
          );
        }
      },
    );
  }
}

class TimePickerPreview extends StatelessWidget {
  const TimePickerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiButton(
      label: 'Choisir une heure',
      onPressed: () async {
        final time = await UiTimePicker.show(context: context);
        if (time != null && context.mounted) {
          UiSnackBar.show(
            context,
            message: time.format(context),
          );
        }
      },
    );
  }
}

class TooltipPreview extends StatelessWidget {
  const TooltipPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiTooltip(
      message: 'Info utile',
      child: Icon(Icons.info_outline, size: 32),
    );
  }
}

class CountBadgePreview extends StatelessWidget {
  const CountBadgePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        UiCountBadge(
          count: 3,
          child: Icon(Icons.notifications_outlined, size: 28),
        ),
        SizedBox(width: AppSpacing.xl),
        UiCountBadge(
          count: 12,
          child: Icon(Icons.mail_outline, size: 28),
        ),
      ],
    );
  }
}

class BlurViewPreview extends StatelessWidget {
  const BlurViewPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.cardAll,
              gradient: LinearGradient(
                colors: [
                  context.uiColors.primary,
                  context.uiColors.secondary,
                ],
              ),
            ),
          ),
          Center(
            child: UiBlurView(
              borderRadius: AppRadius.cardAll,
              child: const Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: UiText(
                  'Blur / liquid glass',
                  style: UiTextStyle.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneFieldPreview extends StatelessWidget {
  const PhoneFieldPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiPhoneField(
      label: 'Téléphone',
      hint: '6 12 34 56 78',
      initialCountryCode: 'BJ',
      onChanged: (phone) {
        // ignore: avoid_print
        print(phone.completeNumber);
      },
    );
  }
}

class IconsPreview extends StatelessWidget {
  const IconsPreview({super.key});

  static const _icons = <(IconData, String)>[
    (LucideIcons.home, 'home'),
    (LucideIcons.search, 'search'),
    (LucideIcons.phone, 'phone'),
    (LucideIcons.mail, 'mail'),
    (LucideIcons.user, 'user'),
    (LucideIcons.settings, 'settings'),
    (LucideIcons.bell, 'bell'),
    (LucideIcons.heart, 'heart'),
    (LucideIcons.star, 'star'),
    (LucideIcons.camera, 'camera'),
    (LucideIcons.mapPin, 'mapPin'),
    (LucideIcons.calendar, 'calendar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.lg,
      children: [
        for (final (icon, name) in _icons)
          SizedBox(
            width: 72,
            child: Column(
              children: [
                UiIcon(icon, color: context.uiColors.onSurface),
                const SizedBox(height: AppSpacing.xs),
                UiText(name, style: UiTextStyle.labelSmall),
              ],
            ),
          ),
      ],
    );
  }
}
