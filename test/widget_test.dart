import 'package:flutter_test/flutter_test.dart';
import 'package:app5/main.dart';

void main() {
  testWidgets('FocusForge renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const FocusForgeApp());
    expect(find.byType(FocusForgeApp), findsOneWidget);
  });
}
