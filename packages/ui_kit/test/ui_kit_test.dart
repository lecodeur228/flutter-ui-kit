import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  test('tokens exposent des valeurs positives', () {
    expect(AppSpacing.md, greaterThan(0));
    expect(AppRadius.button, greaterThan(0));
    expect(AppSizes.buttonMd, greaterThan(0));
    expect(AppBorders.hairline, greaterThan(0));
    expect(AppOpacity.disabled, lessThan(1));
    expect(AppMotion.normal.inMilliseconds, greaterThan(0));
    expect(AppElevation.of(2), isNotEmpty);
  });

  testWidgets('UiButton adaptatif se construit', (tester) async {
    await tester.pumpWidget(
      UiApp(
        home: Scaffold(
          body: UiButton(label: 'Continuer', onPressed: () {}),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Continuer'), findsOneWidget);
  });

  testWidgets('UiSwitch adaptatif se construit', (tester) async {
    await tester.pumpWidget(
      const UiApp(
        home: Scaffold(
          body: Center(child: UiSwitch(value: true, onChanged: null)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(UiSwitch), findsOneWidget);
  });

  testWidgets('UiIcon Lucide se construit', (tester) async {
    await tester.pumpWidget(
      const UiApp(
        home: Scaffold(body: Center(child: UiIcon(LucideIcons.home))),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(UiIcon), findsOneWidget);
  });

  testWidgets('UiPhoneField se construit', (tester) async {
    await tester.pumpWidget(
      const UiApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: UiPhoneField(initialCountryCode: 'BJ'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(UiPhoneField), findsOneWidget);
    expect(find.text('+229'), findsOneWidget);
  });

  testWidgets('context.uiKit est disponible sous UiApp', (tester) async {
    late UiKitColors kit;

    await tester.pumpWidget(
      UiApp(
        home: Builder(
          builder: (context) {
            final theme = Theme.of(context);
            kit = theme.extension<UiKitColors>() ?? UiKitColors.light;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(kit.success, AppColors.success);
  });
}
