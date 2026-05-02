import 'package:flutter_test/flutter_test.dart';
import 'package:bank_app/main.dart';

void main() {
  testWidgets('Bank app loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BankApp());

    // Verify that the app loads with the login screen
    expect(find.text('Bank App'), findsOneWidget);
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
