import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tasknest/main.dart';

void main() {
  testWidgets(
    'login page validates credentials and toggles password visibility',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Welcome back'), findsOneWidget);
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.text('Email address'), findsOneWidget);

      final passwordField = find.byKey(const ValueKey('password-field'));
      expect(passwordField, findsOneWidget);
      expect(find.byTooltip('Show password'), findsOneWidget);

      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(find.byTooltip('Hide password'), findsOneWidget);

      await tester.ensureVisible(find.text('Sign in'));
      await tester.tap(find.text('Sign in'));
      await tester.pump();
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.text('Enter your password'), findsWidgets);

      await tester.enterText(find.byType(TextFormField).first, 'not-an-email');
      await tester.ensureVisible(find.text('Sign in'));
      await tester.tap(find.text('Sign in'));
      await tester.pump();
      expect(find.text('Enter a valid email address'), findsOneWidget);
    },
  );
}
