import 'package:demo_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('affiche le catalogue ui_kit adaptatif', (tester) async {
    await tester.pumpWidget(const DemoApp());
    await tester.pumpAndSettle();
    expect(find.text('ui_kit'), findsWidgets);
    expect(find.text('Search components'), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
    expect(find.text('Switch'), findsOneWidget);
  });
}
