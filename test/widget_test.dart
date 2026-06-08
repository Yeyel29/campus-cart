import 'package:campus_kart/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('starts on the login route', (tester) async {
    await tester.pumpWidget(const CampusKartApp());
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });
}
