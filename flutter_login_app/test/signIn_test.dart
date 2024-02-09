import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_app/screens/signIn.dart';
import 'package:flutter_login_app/screens/signUp.dart';
import 'package:flutter_login_app/screens/home.dart';

void main() {
  group('SignInScreen widget test', () {
    testWidgets('UI elements are rendered', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInScreen()));

      // Verify that the email and password text fields are rendered
      expect(find.byType(TextField), findsNWidgets(2));
      
      // Verify that the sign-in button is rendered
      expect(find.text('Sign In'), findsOneWidget);

      // Verify that the sign-up option is rendered
      expect(find.text("Don't have an account?"), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('Successful sign-in navigates to home screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInScreen()));

      // Fill in email and password
      await tester.enterText(find.byKey(Key('emailTextField')), 'test@example.com');
      await tester.enterText(find.byKey(Key('passwordTextField')), 'password');

      // Tap the sign-in button
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Verify that navigation occurred
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Tap sign up option navigates to sign up screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInScreen()));

      // Tap the sign-up option
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Verify that navigation occurred
      expect(find.byType(SignUpScreen), findsOneWidget);
    });
  });
}
