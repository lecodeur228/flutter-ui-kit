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
└── .github/workflows/      # CI + release tags
```

Pas de squelette d’app : une nouvelle app = `flutter create` + dépendance sur un **tag** du kit. Cloner ce repo seulement pour faire évoluer le design system.

## Démarrer (monorepo)

```bash
cd packages/ui_kit && flutter pub get && flutter test
cd apps/demo_app && flutter pub get && flutter run
```

## Utiliser dans une app

### Projets externes (recommandé) — tag GitHub

```yaml
dependencies:
  ui_kit:
    git:
      url: https://github.com/lecodeur228/flutter-ui-kit.git
      path: packages/ui_kit
      ref: v1.0.0
```

Repo privé : utiliser SSH (`git@github.com:lecodeur228/flutter-ui-kit.git`) ou un credential / `GIT_TOKEN` selon la machine et le CI de l’app.

### Monorepo local — path

```yaml
dependencies:
  ui_kit:
    path: ../../packages/ui_kit
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
3. Push sur `main` → CI valide (analyze · test · build web)
4. Créer et pousser le tag : `git tag vX.Y.Z && git push origin vX.Y.Z`
5. Le workflow **Release** vérifie que le tag = version pubspec, puis crée la GitHub Release

Consommer ensuite `ref: vX.Y.Z` dans le `pubspec.yaml` de l’app.
