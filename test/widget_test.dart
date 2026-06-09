import 'package:campus_kart/app/app.dart';
import 'package:campus_kart/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    AppRouter.router.go('/login');
  });

  testWidgets('starts on the login route', (tester) async {
    await tester.pumpWidget(const CampusKartApp());
    await tester.pumpAndSettle();

    expect(find.text('CampusKart'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
  });

  testWidgets('empty prototype login opens the dashboard', (tester) async {
    await tester.pumpWidget(const CampusKartApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('dashboardGreeting')), findsOneWidget);
    expect(find.text('Quick Services'), findsOneWidget);
  });

  testWidgets('toggles password visibility and completes mock login', (
    tester,
  ) async {
    await tester.pumpWidget(const CampusKartApp());
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('emailField')),
      'student@vsu.edu.ph',
    );
    await tester.enterText(find.byKey(const Key('passwordField')), 'prototype');

    final passwordField = tester.widget<TextField>(
      find.byKey(const Key('passwordField')),
    );
    expect(passwordField.obscureText, isTrue);

    await tester.tap(find.byKey(const Key('passwordVisibilityButton')));
    await tester.pump();

    final visiblePasswordField = tester.widget<TextField>(
      find.byKey(const Key('passwordField')),
    );
    expect(visiblePasswordField.obscureText, isFalse);

    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('dashboardGreeting')), findsOneWidget);
  });
}
