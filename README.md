# ui_kit monorepo

Design system Flutter local (`packages/ui_kit`) + app démo (`apps/demo_app`).

## Structure

```
Flutter/
├── apps/demo_app/       # showcase du kit
├── packages/ui_kit/     # tokens + thème + composants
└── .github/workflows/   # CI analyze / test / build
```

## Utilisation dans une app

```yaml
dependencies:
  ui_kit:
    path: ../../packages/ui_kit
```

```dart
import 'package:ui_kit/ui_kit.dart';

MaterialApp(
  theme: UiKitTheme.light,
  darkTheme: UiKitTheme.dark,
  home: ...,
);
```

## Contenu MVP (v0.1.0)

**Tokens** : couleurs, spacing, radius, sizes, typography, elevation, borders, opacity, motion  
**Thème** : light / dark + `context.uiKit`  
**Composants** : `UiButton`, `UiIconButton`, `UiTextField`, `UiCard`, `UiText`, `UiDivider`, `UiBadge`

## Commandes

```bash
# Package
cd packages/ui_kit && flutter pub get && flutter analyze && flutter test

# Demo
cd apps/demo_app && flutter pub get && flutter run
```

## Versioning

1. Modifier le kit dans `packages/ui_kit`
2. Bumper `version` dans `packages/ui_kit/pubspec.yaml` (semver)
3. Push → GitHub Actions valide analyze / test / build web
4. L’app path consomme immédiatement le code local
