# Changelog

## 1.3.0

API multi-marque pour réutiliser les composants `Ui*` hors Journey.

- `UiKitTheme.from(...)` — construit un `ThemeData` à partir d'un `ColorScheme`,
  `UiKitColors`, fond scaffold, et optionnellement `TextTheme` / `fontFamily`
- Presets `UiKitTheme.light` / `.dark` inchangés (délèguent à `from`)

## 1.2.0

Composants Journey recustomisés (boutons + inputs).

- `UiButton` / `UiIconButton` Material pill (primary, secondary, outline, ghost, destructive) + loading
- `UiSlideButton` (slide-to-action)
- `UiTextField` / `UiTextFormField` décoration Journey (radius 16, erreur, disabled)
- `UiCheckbox` / `UiRadio` / `UiSwitch` avec labels optionnels et couleurs primary
- `UiRadioGroup` (API Flutter `RadioGroup`) + `UiRadio` sans `groupValue` déprécié
- Ajustements `UiScaffold` (safe area sous toolbar native iOS) + `AppRadius.input`
- Catalogue demo mis à jour

## 1.1.0

Design system **Journey** (Share Your Journey) — direction visuelle améliorée.

- Palette vert route `#0D9F6E` + marine `#1E3A5F` (light/dark dédiés)
- Canvas teinté, bordures vertes, feedback ambre / danger affinés
- Typo **Plus Jakarta Sans** (`google_fonts`)
- Spacing 4-based, radius réguliers, CTA 52px
- Helpers sémantiques `context.textBody` / `textHero` / `textPrice`…

## 1.0.0

Première release stable du design system.

- Tokens (couleurs, spacing, radius, sizes, typo, elevation, borders, opacity, motion)
- `UiApp` / `UiScaffold` adaptatifs (liquid glass iOS 26+, Cupertino, Material)
- Contrôles adaptatifs (boutons, switch, checkbox, radio, slider, segmented, text fields)
- `UiPhoneField` via `intl_phone_field` avec sélecteur pays en bottom sheet
- Icônes Lucide (`UiIcon` / `LucideIcons`)
- Overlays (dialog, snackbar, date/time picker, context/popup menu, tooltip)
- Structure (tab view, form section, expansion tile, list tile, divider)
- Contenu (card, blur, text, badge, count badge)
- Catalogue showcase `apps/demo_app` + CI GitHub Actions

## 0.4.0

- Lucide icons
- Champ téléphone (première version)

## 0.3.0

- Composants adaptatifs étendus (FAB, pickers, tab view, etc.)
- Insets SafeArea sous toolbar / tab bar iOS

## 0.2.0

- Couche adaptive_platform_ui (`UiApp`, wrappers)

## 0.1.0

- Tokens + composants Material de base + démo
