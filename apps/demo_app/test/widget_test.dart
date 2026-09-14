import 'package:demo_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('affiche le showcase ui_kit', (tester) async {
    await tester.pumpWidget(const DemoApp());
    expect(find.text('ui_kit'), findsOneWidget);
    expect(find.text('Boutons'), findsOneWidget);
  });
}
