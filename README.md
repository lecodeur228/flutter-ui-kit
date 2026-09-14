# ui_kit monorepo

Design system Flutter (`packages/ui_kit`) + app catalogue (`apps/demo_app`).

Repo : https://github.com/lecodeur228/flutter-ui-kit

## Stack

- **adaptive_platform_ui** — iOS 26 liquid glass / Cupertino / Material
- **lucide_icons_flutter** — icônes Lucide
- **intl_phone_field** — données pays + drapeaux (`UiPhoneField` + bottom sheet)

## Structure

```
Flutter/
├── apps/demo_app/          # showcase (liste → page détail unique)
├── packages/ui_kit/        # design system (v1.0.0)
└── .github/workflows/      # analyze · test · build web
```

## Démarrer

```bash
cd packages/ui_kit && flutter pub get && flutter test
cd apps/demo_app && flutter pub get && flutter run
```

## Utiliser dans une app

```yaml
dependencies:
  ui_kit:
    path: ../path/to/packages/ui_kit
```

```dart
import 'package:ui_kit/ui_kit.dart';

UiApp(
  home: UiScaffold(
    title: 'App',
    body: UiButton(label: 'OK', onPressed: () {}),
  ),
);
```

## Release

1. Modifier le kit
2. Bumper `packages/ui_kit/pubspec.yaml` + `CHANGELOG.md`
3. Push sur `main` → CI valide
