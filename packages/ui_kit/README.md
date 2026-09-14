# ui_kit

Design system Flutter versionné dans le monorepo [flutter-ui-kit](https://github.com/lecodeur228/flutter-ui-kit).

Les widgets `Ui*` enveloppe [`adaptive_platform_ui`](https://pub.dev/packages/adaptive_platform_ui) :
**iOS 26+ liquid glass**, **iOS legacy Cupertino**, **Android Material 3**.

## Installation

### App externe (recommandé) — tag GitHub

```yaml
dependencies:
  ui_kit:
    git:
      url: https://github.com/lecodeur228/flutter-ui-kit.git
      path: packages/ui_kit
      ref: v1.0.0
```

Repo privé : SSH (`git@github.com:lecodeur228/flutter-ui-kit.git`) ou credential GitHub.

### Monorepo local — path

```yaml
dependencies:
  ui_kit:
    path: ../../packages/ui_kit
```

## Quick start

```dart
import 'package:ui_kit/ui_kit.dart';

UiApp(
  themeMode: ThemeMode.system,
  home: UiScaffold(
    title: 'Mon app',
    useNativeToolbar: true,
    useNativeBottomBar: true,
    destinations: [
      UiNavDestination(
        label: 'Home',
        icon: LucideIcons.home,
        iosSymbol: 'house.fill',
      ),
    ],
    body: Column(
      children: [
        UiButton(label: 'Continuer', onPressed: () {}),
        UiPhoneField(
          initialCountryCode: 'BJ',
          onChanged: (phone) => print(phone.completeNumber),
        ),
      ],
    ),
  ),
);
```

## Contenu

### Fondations
`AppColors`, `AppSpacing`, `AppRadius`, `AppSizes`, `AppTypography`, `AppElevation`, `AppBorders`, `AppOpacity`, `AppMotion`

### Shell
`UiApp`, `UiScaffold`, `UiKitTheme`, `context.uiKit` / `context.uiColors`

### Contrôles
`UiButton`, `UiIconButton`, `UiFloatingActionButton`, `UiSwitch`, `UiCheckbox`, `UiRadio`, `UiSlider`, `UiSegmentedControl`, `UiTextField`, `UiTextFormField`, `UiPhoneField`

### Structure
`UiTabView`, `UiFormSection`, `UiExpansionTile`, `UiListTile`, `UiDivider`

### Overlays
`UiDialog`, `UiSnackBar`, `UiDatePicker`, `UiTimePicker`, `UiContextMenu`, `UiPopupMenu`, `UiTooltip`

### Contenu
`UiCard`, `UiBlurView`, `UiText`, `UiBadge`, `UiCountBadge`

### Icônes
[Lucide](https://lucide.dev) — `UiIcon(LucideIcons.home)` / `UiIcons.search`

## Versioning

1. Bumper `version` dans `pubspec.yaml` + `CHANGELOG.md` (semver)
2. Push `main` → CI
3. `git tag vX.Y.Z && git push origin vX.Y.Z` → GitHub Release

Pas de publication pub.dev (`publish_to: none`).

## Démo

```bash
cd apps/demo_app && flutter run
```
