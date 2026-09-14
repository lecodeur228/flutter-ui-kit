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

  testWidgets('UiButton se construit dans le thème kit', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: UiKitTheme.light,
        home: Scaffold(
          body: UiButton(label: 'Continuer', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Continuer'), findsOneWidget);
  });

  testWidgets('context.uiKit est disponible', (tester) async {
    late UiKitColors kit;

    await tester.pumpWidget(
      MaterialApp(
        theme: UiKitTheme.light,
        home: Builder(
          builder: (context) {
            kit = context.uiKit;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(kit.success, AppColors.success);
  });
}
